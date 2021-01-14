# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :minimal_alpine_rendering_example,
  ecto_repos: [MinimalAlpineRenderingExample.Repo]

# Configures the endpoint
config :minimal_alpine_rendering_example, MinimalAlpineRenderingExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HvfS1j64s+JhtGaVXRcbe//Ier4K1/I/Xlp8geS2bhjKODozussUgXwR5QJPsSR9",
  render_errors: [view: MinimalAlpineRenderingExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MinimalAlpineRenderingExample.PubSub,
  live_view: [signing_salt: "De0j2Z0G"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
