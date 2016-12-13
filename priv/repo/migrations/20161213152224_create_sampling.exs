defmodule Cfo.Repo.Migrations.CreateSampling do
  use Ecto.Migration

  def change do
    create table(:samplings) do
      add :place_id, references(:places, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:samplings, [:place_id])
    create index(:samplings, [:user_id])

  end
end
