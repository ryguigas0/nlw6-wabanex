defmodule Wabanex.Users.Delete do
  alias Wabanex.{Repo, User, Trainings}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> delete_user
  end

  defp delete_user({:ok, uuid}) do
    user_to_delete = Repo.get(User, uuid) |> Repo.preload([:trainings])

    if user_to_delete == nil do
      {:error, nil}
    else
      clear_trainings(user_to_delete.trainings)
      # Gets data by id and parses into a struct
      case Repo.delete(user_to_delete) do
        nil -> {:error, nil}
        {:ok, user} -> {:ok, user}
      end
    end
  end

  defp clear_trainings(trainings) when trainings != nil do
    Task.async_stream(trainings, &Trainings.Delete.call(&1.id))
    |> Stream.run()
  end
end
