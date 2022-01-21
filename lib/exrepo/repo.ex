defmodule Exrepo.Repo do
  use Ecto.Repo,
    otp_app: :exrepo,
    adapter: Ecto.Adapters.Postgres
end
