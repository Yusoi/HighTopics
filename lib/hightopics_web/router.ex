defmodule HightopicsWeb.Router do
  use HightopicsWeb, :router

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

  scope "/", HightopicsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    #application resources
    resources "/topics", TopicController
    resources "/users", UserController
    resources "/themes", ThemeController
    resources "/comments", CommentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HightopicsWeb do
  #   pipe_through :api
  # end
end
