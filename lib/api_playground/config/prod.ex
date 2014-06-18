defmodule ApiPlayground.Config.Prod do
  use ApiPlayground.Config

  config :router, port: System.get_env("PORT"),
                  # Full error reports are disabled
                  consider_all_requests_local: false

  config :plugs, code_reload: false

  config :logger, level: :error
end


