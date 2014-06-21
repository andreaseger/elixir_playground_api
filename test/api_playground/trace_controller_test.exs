defmodule ApiPlayground.RouterTest do
  use ApiPlaygroundTest.Case
  import Plug.Test
  alias ApiPlayground.Router
  alias ApiPlayground.Repo
  alias ApiPlayground.Trace

  setup do
    trace = struct(Trace, data: "[{ \"latitude\": 32.9377784729004, \"longitude\": -117.230392456055 }]")
    Repo.insert(trace)
    :ok
  end

  test "fetch existing trace" do
    conn = conn("GET", "/traces/1")
    conn = Router.call(conn, [])

    assert conn.status in 200..399

    assert "[{ \"latitude\": 32.9377784729004, \"longitude\": -117.230392456055 }]" == conn.resp_body
  end

  test "fetch non existing trace" do
    conn = conn("GET", "/traces/23")
    conn = Router.call(conn, [])

    assert conn.status == 404
    assert "" == conn.resp_body
  end
end