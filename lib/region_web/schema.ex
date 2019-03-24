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
      arg :latitude, :float
      arg :longitude, :float
      resolve &Resolvers.LocationDocs.list_location_docs/3
    end

  end
end
