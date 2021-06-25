# Defining the User schema (data model and casting) module
defmodule Wabanex.Exercise do
  use Ecto.Schema
  import Ecto.Changeset # Validating data updates

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
    field :repetitions, :string # 12x10 2x5

    belongs_to :training, Training

    timestamps()
  end

  # Parse, validate the data and create a user
  def changeset(exercise, params) do
    exercise # exercise empty struct comes with cast_assoc from training.ex
    |> cast(params, @fields) # casts the values according to the fields
    |> validate_required(@fields) # all the fields in the list are required
  end
end
