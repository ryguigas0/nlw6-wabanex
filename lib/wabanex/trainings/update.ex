defmodule Wabanex.Trainings.Update do
  alias Wabanex.{Repo, Training}

  def call(params) do
    to_update = Repo.get(Training, params.id)
    changes = Training.changeset(params, to_update)

    case Repo.update(changes) do
      {:ok, updated} -> {:ok, updated}
      nil -> {:error, "Training not updated"}
    end
  end
end
