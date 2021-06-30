defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  # Description
  @desc "Logic user representation"
  object :user do
    # Custom type
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    # Password cannot be accesible on the API
    field :trainings, list_of(:training)
    field :weight, :float
    field :height, :float
    field :fat_index, :float
    field :muscle_index, :float
  end

  # Description
  @desc "User creation data input"
  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
    field :weight, :float
    field :height, :float
    field :fat_index, :float
    field :muscle_index, :float
  end

  @desc "User updating data input"
  input_object :update_user_input do
    field :id, non_null(:uuid4)
    field :name, :string, description: "Users name"
    field :email, :string, description: "Users email"
    field :password, :string, description: "Users password"
    field :weight, :float
    field :height, :float
    field :fat_index, :float
    field :muscle_index, :float
  end
end
