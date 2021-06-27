# Defining the User schema (data model and casting) module
defmodule Wabanex.Training do
  use Ecto.Schema
  # Validating data updates
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  # Ecto, the id column in this table is binary_id and autogenerates
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Creates an module constant
  @fields [:start_date, :end_date, :user_id]

  schema "trainings" do
    field :start_date, :date
    field :end_date, :date

    # One User has many trainings
    belongs_to :user, User
    # One training has many exercises
    has_many :exercises, Exercise

    timestamps()
  end

  # Parse, validate the data and create a user
  def changeset(params) do
    # __MODULE__ === Wabanex.User
    %__MODULE__{}
    # casts the values according to the fields
    |> cast(params, @fields)
    # all the fields in the list are required
    |> validate_required(@fields)
    |> cast_assoc(:exercises)
  end
end
