defmodule Region.Repo do
  use Ecto.Repo,
    otp_app: :region,
    adapter: Ecto.Adapters.Postgres

  def execute_and_load(sql, params, model, sort_direction) do
    result = Ecto.Adapters.SQL.query!(__MODULE__, sql, params)

    # sort rows before loading into Ecto model
    # for some reason the result does not respect the ORDER BY clause
    rows = Enum.sort(
      result.rows,
      fn x, y ->
        case sort_direction do
          "closest" -> Enum.at(x, 4) < Enum.at(y, 4)
          "newest" -> Enum.at(x, 0) > Enum.at(y, 0)
          _ -> Enum.at(x, 0) > Enum.at(y, 0)
        end
      end
    )

    Enum.map(rows, &load(model, {result.columns, &1}))
  end
end
