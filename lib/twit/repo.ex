defmodule Twit.Repo do
  use Ecto.Repo,
    otp_app: :twit,
    adapter: Ecto.Adapters.Postgres
end
