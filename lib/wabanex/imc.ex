# Defines a module IMC inside the Wabanex module
defmodule Wabanex.IMC do
  # Defines a function called calculate that accepts an argument
  def calculate(%{"filename" => filename}) do
    # The pipe operator (|>) sends the output of an function to another
    File.read(filename) |> handle_file
  end

  # Defines a private function -> cannot be called outside this module
  # If the input is {:ok, something} the Pattern matching makes this function run
  defp handle_file({:ok, content}) do
    data =
      content
      |> String.split("\n")
      # Instead of fn line -> parse_line(line) end
      |> Enum.map(&parse_line/1)
      # Parses the input as the argument type
      |> Enum.into(%{})

    {:ok, data}
  end

  # If the input is {:error, _something_not_needed} the Pattern matching makes this other function run
  defp handle_file({:error, _why}), do: {:error, "File not readable"}

  defp parse_line(line) do
    line
    |> String.split(", ")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> parse_list()
  end

  # Smaller function definition
  defp parse_list([name, height, weight]), do: {name, weight / (height * height)}
end
