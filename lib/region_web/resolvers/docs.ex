defmodule RegionWeb.Resolvers.Docs do

  def list_docs(_parent, _args, _resolution) do
    {:ok, Region.Docs.list_docs()}
  end

end
