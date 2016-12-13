defmodule Cfo.Sampling do
  use Cfo.Web, :model

  schema "samplings" do
    belongs_to :place, Cfo.Place
    belongs_to :user, Cfo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
