defmodule RegionWeb.Schema do
  use Absinthe.Schema
  import_types RegionWeb.Schema.Types

  alias RegionWeb.Resolvers

  query do

    @desc "Get all docs"
    field :docs, list_of(:doc) do
      resolve &Resolvers.Docs.list_docs/3
    end

    @desc "Get all location docs"
    field :location_docs, list_of(:location_doc) do
      resolve &Resolvers.LocationDocs.list_location_docs/3
    end

  end

  mutation do

    @desc "Create a doc"
    field :create_doc, type: :location_doc do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :latitude, non_null(:float)
      arg :longitude, non_null(:float)

      resolve &Resolvers.LocationDocs.create_doc/3
    end

  end
end
