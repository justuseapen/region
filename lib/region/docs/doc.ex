defmodule Region.Docs.Doc do
  use Ecto.Schema
  import Ecto.Changeset


  schema "docs" do
    field :title, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(doc, attrs) do
    doc
    |> cast(attrs, [:body, :title])
    |> validate_required([:body])
  end
end
