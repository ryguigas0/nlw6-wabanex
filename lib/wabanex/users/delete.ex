defmodule Wabanex.Users.Delete do
  alias Wabanex.{Repo, User}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> delete_user
  end

  defp delete_user({:ok, uuid}) do
    to_delete = Repo.get(User, uuid)

    # Gets data by id and parses into a struct
    case Repo.delete(to_delete) do
      nil -> {:error, "User not found"}
      {:ok, _user} -> {:ok, "User has been deleted!"}
    end
  end
end
