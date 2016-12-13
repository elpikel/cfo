defmodule Cfo.UserView do
  use Cfo.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Cfo.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Cfo.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email}
  end
end
