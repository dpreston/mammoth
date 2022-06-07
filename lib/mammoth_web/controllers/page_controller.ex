defmodule MammothWeb.PageController do
  use MammothWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
