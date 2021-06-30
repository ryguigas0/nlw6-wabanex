defmodule WabanexWeb.Resolvers.User do
  alias Wabanex.Users.Get, as: GetUser
  alias Wabanex.Users.Create, as: CreateUser
  alias Wabanex.Users.Update, as: UpdateUser
  alias Wabanex.Users.Delete, as: DeleteUser

  def get(%{id: user_id}, _context), do: GetUser.call(user_id)
  def delete(%{id: user_id}, _context), do: DeleteUser.call(user_id)
  def create(%{input: params}, _context), do: CreateUser.call(params)
  def update(%{input: params}, _context), do: UpdateUser.call(params)
end
