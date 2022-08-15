defmodule PolkaImdb.Repo do
  use Ecto.Repo,
    otp_app: :polka_imdb,
    adapter: Ecto.Adapters.Postgres
end
