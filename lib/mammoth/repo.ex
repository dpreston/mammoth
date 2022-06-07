defmodule Mammoth.Repo do
  use Ecto.Repo,
    otp_app: :mammoth,
    adapter: Ecto.Adapters.Postgres
end
