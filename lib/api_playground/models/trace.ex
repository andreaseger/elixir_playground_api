defmodule ApiPlayground.Trace do
  use Ecto.Model
  alias ApiPlayground.Utils, as: U

  schema "traces" do
    field :data, :string
  end

  validate trace,
    data: validate_json()

  defp validate_json(:data, nil),
    do: [{:data, "missing data"}]
  defp validate_json(:data, ""),
    do: [{:data, "missing data"}]
  defp validate_json(:data, json_) do
    case U.json_decode(json_) do
      {:ok, _} ->
        []
      {:error, term} ->
        [{:data, "malformed json"}]
    end
  end
end

