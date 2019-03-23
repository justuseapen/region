defmodule Region.Repo.Migrations.CreateDocs do
  use Ecto.Migration

  def change do
    create table(:docs) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
