defmodule Wabanex.Trainings.Delete do
  import Ecto.Query

  alias Wabanex.{Exercise, Training, Repo}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> delete_training
  end

  def delete_training({:ok, uuid}) do
    query = from e in Exercise, where: e.training_id == ^uuid
    Repo.delete_all(query)

    training_to_delete = Repo.get(Training, uuid)

    case Repo.delete(training_to_delete) do
      nil -> {:error, "Training not found"}
      {:ok, _training} -> "Training deleted!"
    end
  end
end
