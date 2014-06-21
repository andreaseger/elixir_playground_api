defmodule ApiPlayground.Config.Test do
  use ApiPlayground.Config

  config :router, port: 4001,
                  ssl: false,
                  # Full error reports are enabled
                  consider_all_requests_local: true

  config :plugs, code_reload: true

  config :logger, level: :error

  config :db, uri: "ecto://foo:bar@localhost/api_playground_test"
end


