defmodule Wabanex.IMCTest do
  # Async tests -> EVEN MORE faster
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "When the file exists, returns the parsed data" do
      expected_result = {
        :ok,
        %{
          "Name" => 20.761245674740486,
          "Noma" => 21.604938271604937,
          "Nome" => 22.1606648199446,
          "Nomi" => 19.531249999999996,
          "Nume" => 17.77777777777778
        }
      }

      result = IMC.calculate(%{"filename" => "students.csv"})

      assert expected_result == result
    end

    test "When the file does not exists, returns an error" do
      result = IMC.calculate(%{"filename" => "wrong_name.csv"})

      assert {:error, "File not readable"} == result
    end
  end
end
