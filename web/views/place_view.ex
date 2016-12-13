defmodule Cfo.PlaceView do
  use Cfo.Web, :view

  def render("index.json", %{places: places}) do
    %{data: render_many(places, Cfo.PlaceView, "place.json")}
  end

  def render("show.json", %{place: place}) do
    %{data: render_one(place, Cfo.PlaceView, "place.json")}
  end

  def render("place.json", %{place: place}) do
    %{id: place.id,
      name: place.name,
      location: place.location}
  end
end
