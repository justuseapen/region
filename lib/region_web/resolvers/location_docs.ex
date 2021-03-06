defmodule RegionWeb.Resolvers.LocationDocs do
  alias Region.Docs
  alias Region.LocationDocs

  def list_location_docs(_parent, %{latitude: latitude, longitude: longitude, sort_direction: sort_direction}, _resolution) do
    {:ok, Region.LocationDocs.list_location_docs(latitude, longitude, sort_direction)}
  end
  def list_location_docs(_parent, _args, _resolution) do
    {:ok, Region.LocationDocs.list_location_docs()}
  end

  def create_doc(_parent, args, _resoltion) do
    {:ok, doc} = Docs.create_doc(%{title: args[:title], body: args[:body]})
    LocationDocs.create_location_doc(%{doc_id: doc.id, latitude: args[:latitude], longitude: args[:longitude]})
  end

end
