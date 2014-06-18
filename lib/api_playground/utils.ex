defmodule ApiPlayground.Utils do
  @moduledoc """
  Assorted utility functions.
  """

  def json_encode(map) do
    Jazz.encode!(map)
  end

  def json_decode!(json) do
    Jazz.decode!(json)
  end

  def json_decode(json) do
    Jazz.decode(json)
  end

  def ecto_now do
    Ecto.DateTime.from_erl(:calendar.universal_time)
  end
end

