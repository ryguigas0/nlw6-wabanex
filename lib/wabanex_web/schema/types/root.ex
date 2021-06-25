# Where is the graphql queries and mutations
defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.{Schema, Resolvers}

  alias Crudry.Middlewares.TranslateErrors

  alias Schema.Types

  alias Resolvers.User, as: UserResolver
  alias Resolvers.Training, as: TrainingResolver

  # types imported here are imported everywhere
  import_types Types.Custom.UUID4  # import custom types
  import_types(Types.User)
  import_types(Types.Training)

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
      middleware TranslateErrors # Error translation middleware
    end
    field :create_training, type: :training do
      arg :input, non_null(:create_training_input) # needs an input to create an user

      resolve &TrainingResolver.create/2
      middleware TranslateErrors # Error translation middleware
    end
  end
end
