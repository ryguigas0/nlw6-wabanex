# Defining the User schema (data model and casting) module
defmodule Wabanex.User do
  use Ecto.Schema
  # Validating data updates
  import Ecto.Changeset

  alias Wabanex.Training

  # Ecto, the id column in this table is binary_id and autogenerates
  @primary_key {:id, :binary_id, autogenerate: true}

  # Creates an module constant
  @fields [:email, :password, :name, :weight, :height, :fat_index, :muscle_index]
  @required_fields [:email, :password, :name]

  schema "users" do
    # Any value -> cast as string
    field :email, :string
    field :name, :string
    field :password, :string
    field :weight, :float
    field :height, :float
    field :fat_index, :float
    field :muscle_index, :float

    has_many :trainings, Training

    timestamps()
  end

  # Parse, validate the data and create a user
  def changeset(params) do
    # __MODULE__ === Wabanex.User
    %__MODULE__{}
    # casts the values according to the fields
    |> cast(params, @fields)
    # all the fields in the list are required
    |> validate_required(@required_fields)
    # this field needs to be at least 8 chracters
    |> validate_length(:password, min: 8)
    # this field needs to be at least 2 chracters
    |> validate_length(:name, min: 2)
    # this field needs to fulfill the regex (have a @)
    |> validate_format(:email, ~r/@/)
    |> validate_number(:fat_index, greater_than_or_equal_to: 0.01, less_than_or_equal_to: 1)
    |> validate_number(:muscle_index, greater_than_or_equal_to: 0.01, less_than_or_equal_to: 1)
    |> validate_number(:height, not_equal_to: 0)
    |> validate_number(:weight, not_equal_to: 0)
    # is this data unique in the database?
    |> unique_constraint([:email])
  end
end
