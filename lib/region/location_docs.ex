defmodule Region.LocationDocs do
  @moduledoc """
  The Docs context.
  """

  import Ecto.Query, warn: false
  alias Region.Repo

  alias Region.LocationDocs.LocationDoc

  @doc """
  Returns the list of docs.

  ## Examples

      iex> list_location_docs()
      [%LocationDoc{}, ...]

  """
  def list_location_docs do
    Repo.all(LocationDoc)
  end
end
