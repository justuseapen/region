defmodule RegionWeb.Resolvers.LocationDocs do

  def list_location_docs(_parent, %{latitude: latitude, longitude: longitude}, _resolution) do
    {:ok, Region.LocationDocs.list_location_docs(latitude, longitude)}
  end
  def list_location_docs(_parent, _args, _resolution) do
    {:ok, Region.LocationDocs.list_location_docs()}
  end

end
