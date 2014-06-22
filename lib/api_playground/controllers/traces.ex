defmodule ApiPlayground.Controller.Traces do
  use Phoenix.Controller
  alias ApiPlayground.Repo
  alias ApiPlayground.Trace
  alias ApiPlayground.Utils, as: U

  def index(conn) do
    text conn, "index"
  end

  def show(conn) do
    case Repo.get(Trace, conn.params["id"]) do
      nil ->
        text conn, 404, ""
      trace ->
        json conn, 200, trace.data
    end
  end

  def delete(conn) do
    trace = Repo.get(Trace, conn.params["id"])

    case Repo.delete(trace) do
      :ok ->
        json conn, 200, U.json_encode(%{id: trace.id})
      errors ->
        json conn, 400, U.json_encode(%{errors: errors})
    end
  end

  def create(conn) do
    {:ok, body, conn} = read_body(conn, length: 10_000)
    trace = struct(Trace, data: body)

    case Trace.validate(trace) do
      [] ->
        trace = Repo.insert(trace)
        json conn, 200, U.json_encode(%{id: trace.id})
      errors ->
        json conn, 400, U.json_encode(%{errors: errors})
    end
  end

  def update(conn) do
    {:ok, body, conn} = read_body(conn, length: 10_000)
    trace = Repo.get(Trace, conn.params["id"]) |> struct(data: body)

    case Trace.validate(trace) do
      [] ->
        Repo.update(trace)
        json conn, 200, U.json_encode(%{id: trace.id})
      errors ->
        json conn, 400, U.json_encode(%{errors: errors})
    end
  end
end
