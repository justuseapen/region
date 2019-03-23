defmodule Region.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :latitude, :decimal
      add :longitude, :decimal
      add :doc_id, references(:docs)

      timestamps()
    end

  end
end
