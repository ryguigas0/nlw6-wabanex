defmodule Wabanex.UserTest do
  # Already configured file
  # Async is recommended for postgres
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "When all params are valid, returns a changeset" do
      params = %{email: "impostor@amongus.com", password: "crewmateDead69", name: "Sussus Amogus"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{
                 email: "impostor@amongus.com",
                 name: "Sussus Amogus",
                 password: "crewmateDead69"
               },
               errors: []
             } = response
    end

    test "When there are invalid params, returns a invalid changeset" do
      params = %{email: "impostoramongus.com", password: "c", name: "Su"}

      response = User.changeset(params)

      assert errors_on(response) == %{
               email: ["has invalid format"],
               password: [
                 "should be at least 8 character(s)"
               ]
             }
    end
  end
end
