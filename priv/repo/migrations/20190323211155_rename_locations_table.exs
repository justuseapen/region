defmodule Region.Repo.Migrations.RenameLocationsTable do
  use Ecto.Migration

  def change do
    rename table(:locations), to: table(:location_docs)
  end
end
