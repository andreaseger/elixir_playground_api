defmodule ApiPlayground.Config do
  use Phoenix.Config.App

  config :router, port: System.get_env("PORT")

  config :plugs, code_reload: false

  config :logger, level: :error

  config :db, uri: System.get_env("API_PLAYGROUND_DB_URI")
end


