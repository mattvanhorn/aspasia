# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aspasia,
  ecto_repos: [Aspasia.Repo]

# Configures the endpoint
config :aspasia, AspasiaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8C0CUSmZwPAhsLzGcLXywp7kNuz6XhSFqsFfREb6rdoNN96i8KsECofT8uEoUsSu",
  render_errors: [view: AspasiaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Aspasia.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :aspasia,
  account_service: Aspasia.AccountService

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
