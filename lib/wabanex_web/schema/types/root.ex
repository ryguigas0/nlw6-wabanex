# Where is the graphql queries and mutations
defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver

  import_types WabanexWeb.Schema.Types.User # import custom types

  object :root_query do
    field :get_user, type: :user do # "get route"
      # what is needed to get an user
      arg :id, non_null(:uuid4) # imported with the User type

      # how can you get what was queried?
      resolve &UserResolver.get/2 # the same as: fn params, context -> UserResolver.get(params, context) end
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input) # needs an input to create an user

      resolve &UserResolver.create/2
    end
  end
end
