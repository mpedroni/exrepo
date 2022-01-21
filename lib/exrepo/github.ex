defmodule Exrepo.GitHub do
  use Tesla, only: [:get]

  plug Tesla.Middleware.BaseUrl, "https://api.github.com/users/"
  plug Tesla.Middleware.JSON

  def get_user_repos(username) do
    "#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, Enum.map(body, &parse_repo/1)}
  end

  defp handle_get({:ok, %Tesla.Env{body: body}}) do
    {:error,
     %{
       status: :bad_request,
       message: body["message"],
       documentation_url: body["documentation_url"]
     }}
  end

  defp parse_repo(repo) do
    Map.take(repo, ~w(id name description html_url stargazers_count))
  end
end
