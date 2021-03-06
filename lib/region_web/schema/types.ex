defmodule RegionWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias Region.Repo

  import_types Absinthe.Type.Custom

  object :doc do
    field :id, :id
    field :title, :string
    field :body, :string
    field :inserted_at, :naive_datetime, name: "created_at"
  end

  object :location_doc do
    field :id, :id
    field :latitude, :float
    field :longitude, :float
    field :doc, :doc do
      resolve fn location_doc, _, _ ->
        doc =
          location_doc
          |> Ecto.assoc(:doc)
          |> Repo.one

        {:ok, doc}
      end
    end
  end
end
