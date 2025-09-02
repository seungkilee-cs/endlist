defmodule EndlistBack.Repo do
  use Ecto.Repo,
    otp_app: :endlist_back,
    adapter: Ecto.Adapters.Postgres
end
