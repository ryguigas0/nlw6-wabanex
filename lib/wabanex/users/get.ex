defmodule Wabanex.Users.Get do
  import Ecto.Query

  alias Wabanex.{Training, Repo, User}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> handle_response
  end

  defp handle_response({:ok, uuid}) do
    # Gets data by id and parses into a struct
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, load_training(user)}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()

    # Check if the training is valid -> Have started or not ended before today
    query =
      from t in Training,
        where: ^today >= t.start_date and ^today <= t.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
