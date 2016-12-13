defmodule Cfo.PageController do
  use Cfo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
