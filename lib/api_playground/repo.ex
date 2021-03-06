defmodule ApiPlayground.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url ApiPlayground.Config.env.db[:uri]
  end

  def priv do
    app_dir(:api_playground, "priv/repo")
  end
end

