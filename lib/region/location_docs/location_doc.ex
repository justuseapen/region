defmodule Region.LocationDocs.LocationDoc do
  use Ecto.Schema
  import Ecto.Changeset

  alias Region.Docs.Doc


  schema "location_docs" do
    field :latitude, :float
    field :longitude, :float
    belongs_to :doc, Doc

    timestamps()
  end

  @doc false
  def changeset(doc, attrs) do
    doc
    |> cast(attrs, [:latitude, :longitude])
    |> validate_required([:latitude, :longitude, :doc_id])
  end
end
