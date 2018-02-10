defmodule HightopicsWeb.PageController do
  use HightopicsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
