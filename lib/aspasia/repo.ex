defmodule Aspasia.Repo do
  use Ecto.Repo,
    otp_app: :aspasia,
    adapter: Ecto.Adapters.Postgres
end
