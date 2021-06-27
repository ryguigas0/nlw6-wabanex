# Defining the User schema (data model and casting) module
defmodule Wabanex.Exercise do
  use Ecto.Schema
  # Validating data updates
  import Ecto.Changeset

  alias Wabanex.Training

  # Ecto, the id column in this table is binary_id and autogenerates
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Creates an module constant
  @fields [:name, :protocol_description, :repetitions, :youtube_video_url]

  schema "exercises" do
    field :name, :string
    field :youtube_video_url, :string
    field :protocol_description, :string
    # 12x10 2x5
    field :repetitions, :string

    belongs_to :training, Training

    timestamps()
  end

  # Parse, validate the data and create a user
  def changeset(exercise, params) do
    # exercise empty struct comes with cast_assoc from training.ex
    exercise
    # casts the values according to the fields
    |> cast(params, @fields)
    # all the fields in the list are required
    |> validate_required(@fields)
  end
end
