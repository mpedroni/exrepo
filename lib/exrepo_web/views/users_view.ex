defmodule ExrepoWeb.UsersView do
  use ExrepoWeb, :view

  def render("repos.json", %{repos: repos}) do
    %{
      repos: repos
    }
  end
end
