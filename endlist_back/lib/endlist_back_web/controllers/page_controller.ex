defmodule EndlistBackWeb.PageController do
  use EndlistBackWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
