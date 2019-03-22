defmodule Region.Repo do
  use Ecto.Repo,
    otp_app: :region,
    adapter: Ecto.Adapters.Postgres
end
