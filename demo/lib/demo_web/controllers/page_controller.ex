defmodule DemoWeb.PageController do
  use DemoWeb, :controller
  use NewRelic.Tracer

  @trace :func
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
