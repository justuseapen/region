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
    distance = 1.5 # in miles
    sql = """
          WITH distances AS (
            SELECT
            *,
            (
              3959 *
              acos(cos(radians($1)) *
              cos(radians(latitude)) *
              cos(radians(longitude) -
              radians($2)) +
              sin(radians($1)) *
              sin(radians(latitude)))
            ) AS distance
            FROM location_docs
          )
          SELECT id, latitude, longitude, doc_id, inserted_at
          FROM distances
          WHERE distance < $3;
          """
    Repo.execute_and_load(
      sql,
      [latitude, longitude, distance],
      LocationDoc
    )
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
