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
end
