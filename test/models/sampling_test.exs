defmodule Cfo.SamplingTest do
  use Cfo.ModelCase

  alias Cfo.Sampling

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sampling.changeset(%Sampling{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sampling.changeset(%Sampling{}, @invalid_attrs)
    refute changeset.valid?
  end
end
