defmodule AspasiaWeb.PageController do
  use AspasiaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
