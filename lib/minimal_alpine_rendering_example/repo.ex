defmodule MinimalAlpineRenderingExample.Repo do
  use Ecto.Repo,
    otp_app: :minimal_alpine_rendering_example,
    adapter: Ecto.Adapters.Postgres
end
