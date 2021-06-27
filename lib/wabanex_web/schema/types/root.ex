# Where is the graphql queries and mutations
defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.{Schema, Resolvers}

  alias Crudry.Middlewares.TranslateErrors

  alias Schema.Types

  alias Resolvers.User, as: UserResolver
  alias Resolvers.Training, as: TrainingResolver

  # types imported here are imported everywhere
  # import custom types
  import_types(Types.Custom.UUID4)
  import_types(Types.User)
  import_types(Types.Training)

  object :root_query do
    # "get route"
    field :get_user, type: :user do
      # what is needed to get an user
      # imported with the User type
      arg(:id, non_null(:uuid4))

      # how can you get what was queried?
      # the same as: fn params, context -> UserResolver.get(params, context) end
      resolve(&UserResolver.get/2)
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      # needs an input to create an user
      arg(:input, non_null(:create_user_input))

      resolve(&UserResolver.create/2)
      # Error translation middleware
      middleware(TranslateErrors)
    end

    field :create_training, type: :training do
      # needs an input to create an user
      arg(:input, non_null(:create_training_input))

      resolve(&TrainingResolver.create/2)
      # Error translation middleware
      middleware(TranslateErrors)
    end
  end
end
