defmodule ApiPlayground.Router do
  use Phoenix.Router

  resources "traces", ApiPlayground.Controller.Traces
  # plug Plug.Static, at: "/static", from: :api_playground
  # get "/", ApiPlayground.Controllers.Pages, :index, as: :page
end
