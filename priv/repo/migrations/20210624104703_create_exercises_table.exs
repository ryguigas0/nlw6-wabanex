defmodule Wabanex.Repo.Migrations.CreateExercisesTable do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :name, :string
      add :youtube_video_url, :string
      add :protocol_description, :string
      # 12x10 2x5
      add :repetitions, :string

      add :training_id, references(:trainings)

      timestamps()
    end
  end
end
