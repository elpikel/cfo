defmodule Cfo.PlaceTest do
  use Cfo.ModelCase

  alias Cfo.Place

  @valid_attrs %{location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Place.changeset(%Place{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Place.changeset(%Place{}, @invalid_attrs)
    refute changeset.valid?
  end
end
