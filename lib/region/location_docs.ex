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

  def list_location_docs(latitude, longitude, sort_direction) do
    distance = 1.5 # in miles
    order_by_clause = create_order_by_clause(sort_direction)
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
    SELECT di.id, di.latitude, di.longitude, di.doc_id, di.distance, d.inserted_at
    FROM distances di
    INNER JOIN docs d
      ON d.id = di.doc_id
    WHERE distance < $3
    ORDER BY $4;
    """

    Repo.execute_and_load(
      sql,
      [latitude, longitude, distance, order_by_clause],
      LocationDoc,
      sort_direction
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

  defp create_order_by_clause(sort_direction) do
    case sort_direction do
      "closest" -> "distance ASC"
      "newest" -> "inserted_at DESC"
      _ -> "inserted_at DESC"
    end
  end
end
