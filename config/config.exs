# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wabanex,
  ecto_repos: [Wabanex.Repo]

config :wabanex, Wabanex.Repo,
  username: "postgres",
  password: "postgres"


# Configures the endpoint
config :wabanex, WabanexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LRKLmNVCqr2TUra68JOEAZlNzynlecBJHkhP9CK2wrM+CWQtC+9L59jRTzZnKMg+",
  render_errors: [view: WabanexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Wabanex.PubSub,
  live_view: [signing_salt: "Pk0sGJI3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
