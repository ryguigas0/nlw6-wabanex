defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.{User, Users.Create}

  @test_user %{email: "amongus@amongus.sus", name: "Sussus Amogus", password: "SussyBaka226"}

  describe "users mutations" do
    test "When all params are valid, creates the user", %{conn: conn} do
      mutation = """
      mutation{
        createUser(input: {
          email: "#{@test_user.email}",
          name: "#{@test_user.name}",
          password: "#{@test_user.password}"}
        ){
          id,
          name,
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(200)

      assert %{
               "data" => %{
                 "createUser" => %{
                   "email" => "amongus@amongus.sus",
                   "id" => _id,
                   "name" => "Sussus Amogus"
                 }
               }
             } = response
    end
  end

  describe "users queries" do
    test "if valid id is given, return a user", %{conn: conn} do
      {:ok, %User{id: user_id}} = Create.call(@test_user)

      query = """
      query{
        getUser(id: "#{user_id}"){
          email,
          name,
          id
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(200)

      assert %{
               "data" => %{
                 "getUser" => %{
                   "email" => "amongus@amongus.sus",
                   "name" => "Sussus Amogus",
                   "id" => _id
                 }
               }
             } = response
    end
  end
end
