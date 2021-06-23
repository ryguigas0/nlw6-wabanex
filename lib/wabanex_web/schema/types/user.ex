defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  import_types(WabanexWeb.Schema.Types.Custom.UUID4) # Imports the custom type

  @desc "Logic user representation" # Description
  object :user do
    field :id, non_null(:uuid4) # Custom type
    field :name, non_null(:string)
    field :email, non_null(:string)
    # Password cannot be accesible on the API
  end

  @desc "User data input" # Description
  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
  end
end
