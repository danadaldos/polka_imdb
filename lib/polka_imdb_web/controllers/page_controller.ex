defmodule PolkaImdbWeb.PageController do
  use PolkaImdbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
