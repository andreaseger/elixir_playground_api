defmodule Trace do
  use Ecto.Model

  schema "traces" do
    field :data, :string
  end
end

