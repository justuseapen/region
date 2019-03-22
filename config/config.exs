# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :region,
  ecto_repos: [Region.Repo]

# Configures the endpoint
config :region, RegionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "raOyzMYb8wa1hlFNFn2Vsu2RVq2A1sRDuSR0ui6uLWT8K6uy5tLjdkpHlZvAXN/u",
  render_errors: [view: RegionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Region.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
