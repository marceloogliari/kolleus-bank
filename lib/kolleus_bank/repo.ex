defmodule KolleusBank.Repo do
  use Ecto.Repo,
    otp_app: :kolleus_bank,
    adapter: Ecto.Adapters.Postgres
end
