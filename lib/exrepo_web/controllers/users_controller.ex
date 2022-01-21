defmodule ExrepoWeb.UsersController do
  use ExrepoWeb, :controller

  alias Exrepo.GitHub

  def get_repos(conn, %{"username" => username}) do
    with {:ok, repos} <- GitHub.get_user_repos(username) do
      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos)
    end
  end
end
