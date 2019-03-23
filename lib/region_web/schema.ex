defmodule RegionWeb.Schema do
  use Absinthe.Schema
  @docs %{
  }
  object :doc do
    field :id, :id
    field :name, :string
    field :body, :string
  end

  object :location do
    field :id, :id
    field :latitude, :string
    field :longitude, :string
  end

  query do
    @desc "Get all docs by location"
    field :docs, list_of(:doc) do
      resolve &RegionWeb.Resolvers.Docs.list_docs/3
    end
  end
end

defmodule RegionWeb.Resolvers.Docs do
  def list_docs(_parent, _args, _resolution) do
    {:ok, Docs.list_docs()}
  end
end
