# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hightopics,
  ecto_repos: [Hightopics.Repo]

# Configures the endpoint
config :hightopics, HightopicsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0r6PJ/XQ/uXVO64jkAj8nhcvSj1bwaWVSMw4DCwZjivWhsjoGRlr2zQOm3yf2R+R",
  render_errors: [view: HightopicsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hightopics.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
