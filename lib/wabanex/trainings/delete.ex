defmodule Wabanex.Trainings.Delete do
  import Ecto.Query

  alias Wabanex.{Exercise, Training, Repo}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> delete_training
  end

  def delete_training({:ok, uuid}) do
    training_to_delete = Repo.get(Training, uuid)

    if training_to_delete == nil do
      {:error, nil}
    else
      query = from e in Exercise, where: e.training_id == ^uuid
      Repo.delete_all(query)

      case Repo.delete(training_to_delete) do
        nil -> {:error, nil}
        {:ok, training} -> {:ok, training}
      end
    end
  end
end
