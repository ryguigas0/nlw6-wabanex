defmodule WabanexWeb.Resolvers.Training do
  alias Wabanex.Trainings.Create, as: CreateTraining
  alias Wabanex.Trainings.Get, as: GetTraining

  def get(%{id: training_id}, _context), do: GetTraining.call(training_id)
  def create(%{input: params}, _context), do: CreateTraining.call(params)
end
