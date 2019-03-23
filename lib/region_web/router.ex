defmodule RegionWeb.Router do
  use RegionWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RegionWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug,
    schema: RegionWeb.Schema
end
