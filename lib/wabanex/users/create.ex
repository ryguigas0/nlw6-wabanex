defmodule Wabanex.Users.Create do

  alias Wabanex.{Repo, User}

  def call(params) do
    params # Recieve the data
    |> User.changeset() # Check the data
    |> Repo.insert() # Insert the data
  end
end
