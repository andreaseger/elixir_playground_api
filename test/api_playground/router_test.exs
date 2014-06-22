defmodule ApiPlayground.RouterTest do
  use ApiPlaygroundTest.Case
  import Plug.Test
  alias ApiPlayground.Router
  alias ApiPlayground.Repo
  alias ApiPlayground.Trace
  alias ApiPlayground.Utils, as: U

  setup do
    trace = struct(Trace, data: "[{ \"latitude\": 32.9377784729004, \"longitude\": -117.230392456055 }]")
    trace = Repo.insert(trace)
    {:ok, trace: trace}
  end

  test "fetch existing trace", meta do
    id = meta[:trace].id
    conn = conn(:get, "/traces/#{id}")
    conn = Router.call(conn, [])

    assert conn.status == 200
    assert conn.resp_body == meta[:trace].data
  end

  test "fetch non existing trace" do
    conn = conn(:get, "/traces/22343")
    conn = Router.call(conn, [])

    assert conn.status == 404
    assert conn.resp_body == ""
  end

  test "save new trace" do
    body = "[{ \"latitude\": 32.9377784729004, \"longitude\": -117.230392456055 }]"
    conn = conn(:post,
                "/traces",
                body,
                headers: [{"content-type", "application/json"}])
    conn = Router.call(conn, [])

    assert conn.status == 200
    {:ok, resp} = U.json_decode(conn.resp_body)
    id = resp["id"]

    conn = conn(:get, "/traces/#{id}")
    conn = Router.call(conn, [])

    assert conn.status == 200
    assert conn.resp_body == body
  end

  test "update trace",meta do
    id = meta[:trace].id

    # update this record with a new body

    body2 = "[{ \"latitude\": 32.333, \"longitude\": -32.555555 }]"
    conn = conn(:put,
                "/traces/#{id}",
                body2,
                headers: [{"content-type", "application/json"}])
    conn = Router.call(conn, [])

    assert conn.status == 200
    {:ok, resp} = U.json_decode(conn.resp_body)
    assert id == resp["id"]

    conn = conn(:get, "/traces/#{id}")
    conn = Router.call(conn, [])

    assert conn.status == 200
    assert conn.resp_body == body2
  end

  test "delete existing trace", meta do
    id = meta[:trace].id
    conn = conn(:delete, "/traces/#{id}")
    conn = Router.call(conn, [])

    assert conn.status == 200
    assert conn.resp_body == ""

    # test if this trace is now gone
    conn = conn(:get, "/traces/#{id}")
    conn = Router.call(conn, [])

    assert conn.status == 404
    assert conn.resp_body == ""
  end
end