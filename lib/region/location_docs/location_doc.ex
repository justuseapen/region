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
  def changeset(location_doc, attrs) do
    location_doc
    |> cast(attrs, [:latitude, :longitude, :doc_id])
    |> validate_required([:latitude, :longitude, :doc_id])
  end
end
