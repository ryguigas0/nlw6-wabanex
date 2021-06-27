defmodule Wabanex.Users.Update do
  alias Wabanex.{User, Repo}

  def call(params) do
    to_update = Repo.get(User, params.id)
    updated = Ecto.Changeset.change(to_update, params)

    case Repo.update(updated) do
      {:ok, updated} -> {:ok, updated}
      nil -> {:error, "User not updated"}
    end
  end
end
