defmodule ApiPlayground.Config.Dev do
  use ApiPlayground.Config

  config :router, port: 4000,
                  ssl: false,
                  # Full error reports are enabled
                  consider_all_requests_local: true

  config :plugs, code_reload: true

  config :logger, level: :debug
end


