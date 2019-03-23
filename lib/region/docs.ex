defmodule Region.Docs do
  @moduledoc """
  The Docs context.
  """

  import Ecto.Query, warn: false
  alias Region.Repo

  alias Region.Docs.Doc

  @doc """
  Returns the list of docs.

  ## Examples

      iex> list_docs()
      [%Doc{}, ...]

  """
  def list_docs do
    Repo.all(Doc)
  end

  @doc """
  Creates a doc.

  ## Examples

      iex> create_doc(%{field: value})
      {:ok, %Doc{}}

      iex> create_doc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_doc(attrs \\ %{}) do
    %Doc{}
    |> Doc.changeset(attrs)
    |> Repo.insert()
  end
end
