# Defining the User schema (data model and casting) module
defmodule Wabanex.User do
  use Ecto.Schema
  # Validating data updates
  import Ecto.Changeset

  alias Wabanex.Training

  # Ecto, the id column in this table is binary_id and autogenerates
  @primary_key {:id, :binary_id, autogenerate: true}

  # Creates an module constant
  @fields [:email, :password, :name]

  schema "users" do
    # Any value -> cast as string
    field :email, :string
    field :name, :string
    field :password, :string

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
    |> validate_required(@fields)
    # this field needs to be at least 8 chracters
    |> validate_length(:password, min: 8)
    # this field needs to be at least 2 chracters
    |> validate_length(:name, min: 2)
    # this field needs to fulfill the regex (have a @)
    |> validate_format(:email, ~r/@/)
    # is this data unique in the database?
    |> unique_constraint([:email])
  end
end
