use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :aspasia, AspasiaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :aspasia,
  account_service: AspasiaWeb.AccountServiceMock

# Configure your database
config :aspasia, Aspasia.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATA_DB_USER"),
  password: System.get_env("DATA_DB_PASS"),
  hostname: System.get_env("DATA_DB_HOST"),
  database: "gonano",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
