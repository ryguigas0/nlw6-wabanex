# Defining the User schema (data model and casting) module
defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset # Validating data updates

  alias Wabanex.{Exercise, User}

  # Ecto, the id column in this table is binary_id and autogenerates
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Creates an module constant
  @fields [:start_date, :end_date, :user_id]

  schema "trainings" do

    field :start_date, :date
    field :end_date, :date

    belongs_to :user, User # One User has many trainings
    has_many :exercises, Exercise # One training has many exercises

    timestamps()
  end

  # Parse, validate the data and create a user
  def changeset(params) do
    %__MODULE__{} # __MODULE__ === Wabanex.User
    |> cast(params, @fields) # casts the values according to the fields
    |> validate_required(@fields) # all the fields in the list are required
    |> cast_assoc(:exercises)
  end
end
