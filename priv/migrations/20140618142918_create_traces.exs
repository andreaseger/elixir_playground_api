defmodule ApiPlayground.Repo.Migrations.CreateTraces do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE IF NOT EXISTS traces(
      id serial primary key,
      data text
    )
    """
  end

  def down do
    "DROP TABLE traces"
  end
end
