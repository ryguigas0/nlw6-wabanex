# Defining the User schema (data model and casting) module
defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset # Validating data updates

  # Ecto, the id column in this table is binary_id and autogenerates
  @primary_key {:id, :binary_id, autogenerate: true}

  # Creates an module constant
  @fields [:email, :password, :name]

  schema "users" do
    field :email, :string # Any value -> cast as string
    field :name, :string
    field :password, :string

    timestamps()
  end

  # Parse, validate the data and create a user
  def changeset(params) do
    %__MODULE__{} # __MODULE__ === Wabanex.User
    |> cast(params, @fields) # casts the values according to the fields
    |> validate_required(@fields) # all the fields in the list are required
    |> validate_length(:password, min: 8) # this field needs to be at least 8 chracters
    |> validate_length(:name, min: 2) # this field needs to be at least 2 chracters
    |> validate_format(:email, ~r/@/) # this field needs to fulfill the regex (have a @)
    |> unique_constraint([:email]) # is this data unique in the database?
  end
end
