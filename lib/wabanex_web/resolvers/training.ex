defmodule WabanexWeb.Resolvers.Training do
  alias Wabanex.Trainings.Create, as: CreateTraining
  alias Wabanex.Trainings.Get, as: GetTraining
  alias Wabanex.Trainings.Update, as: UpdateTraining
  alias Wabanex.Trainings.Delete, as: DeleteTraining

  def get(%{id: training_id}, _context), do: GetTraining.call(training_id)
  def delete(%{id: training_id}, _context), do: DeleteTraining.call(training_id)
  def create(%{input: params}, _context), do: CreateTraining.call(params)
  def update(%{input: params}, _context), do: UpdateTraining.call(params)
end
