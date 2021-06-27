defmodule Wabanex.Users.Create do
  alias Wabanex.{Repo, User}

  def call(params) do
    # Recieve the data
    params
    # Check the data
    |> User.changeset()
    # Insert the data
    |> Repo.insert()
  end
end
