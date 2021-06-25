defmodule Wabanex.Trainings.Get do
  alias Wabanex.{Training, Repo}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> handle_response()
  end

  defp handle_response({:ok, uuid}) do
    case Repo.get(Training, uuid) |> Repo.preload([:exercises]) do
      nil -> {:error, "Training not found"}
      training -> {:ok, training}
    end
  end
end
