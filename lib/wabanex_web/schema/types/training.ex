defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types(WabanexWeb.Schema.Types.Exercise)

  # Description
  @desc "Logic training representation"
  object :training do
    # Custom type
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  # Description
  @desc "Training data create input"
  input_object :create_training_input do
    field :user_id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:create_exercise_input)
  end

  @desc "Training data update input"
  input_object :update_training_input do
    field :id, non_null(:uuid4)
    field :start_date, :string
    field :end_date, :string
    field :exercises, list_of(:update_exercise_input)
  end
end
