defmodule Region.Repo do
  use Ecto.Repo,
    otp_app: :region,
    adapter: Ecto.Adapters.Postgres

  def execute_and_load(sql, params, model) do
    result = Ecto.Adapters.SQL.query!(__MODULE__, sql, params)
    Enum.map(result.rows, &load(model, {result.columns, &1}))
  end
end
