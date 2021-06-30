defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  # Description
  @desc "Logic exercise representation"
  object :exercise do
    # Custom type
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  input_object :create_exercise_input do
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  @desc "Exercise data update input"
  input_object :update_exercise_input do
    field :name, non_null(:string)
    field :repetitions, :string
    field :youtube_video_url, :string
    field :protocol_description, :string
  end
end
