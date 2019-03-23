defmodule Region.Docs.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    belongs_to :doc, Region.Docs.Doc
    field :latitude, :decimal
    field :longitude, :decimal
    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:latitude, :longitude])
    |> validate_required([:latitude, :longitude])
  end
end
