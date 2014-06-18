defmodule ApiPlayground.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :api_playground
  get "/", ApiPlayground.Controllers.Pages, :index, as: :page
end
