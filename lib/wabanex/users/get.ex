defmodule Wabanex.Users.Get do

  alias Wabanex.{Repo, User}

  def call(id) do

    id
    |> Ecto.UUID.cast()
    |> handle_response
  end

  defp handle_response({:ok, uuid}) do
    # Gets data by id and parses into a struct
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
