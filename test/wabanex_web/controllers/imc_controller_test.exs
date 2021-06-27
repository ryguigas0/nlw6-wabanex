defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "When all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      expected_response = %{
        "Name" => 20.761245674740486,
        "Noma" => 21.604938271604937,
        "Nome" => 22.1606648199446,
        "Nomi" => 19.531249999999996,
        "Nume" => 17.77777777777778
      }

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert expected_response == response
    end

    test "When params are invalid, returns an error", %{conn: conn} do
      params = %{"filename" => "does_not_exists.file"}

      conn
      |> get(Routes.imc_path(conn, :index, params))
      |> json_response(:bad_request)
    end
  end
end
