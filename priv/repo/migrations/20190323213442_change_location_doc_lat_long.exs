defmodule Region.Repo.Migrations.ChangeLocationDocLatLong do
  use Ecto.Migration

  def change do
    alter table(:location_docs) do
      modify :latitude, :float
      modify :longitude, :float
    end

  end
end
