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

  def list_location_docs(latitude, longitude) do
    Repo.all(LocationDoc)
  end
  def list_location_docs do
    Repo.all(LocationDoc)
  end

  @doc """
  Creates a location_doc.

  ## Examples

      iex> create_location_doc(%{field: value})
      {:ok, %Doc{}}

      iex> create_location_doc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location_doc(attrs \\ %{}) do
    %LocationDoc{}
    |> LocationDoc.changeset(attrs)
    |> Repo.insert()
  end
end
