defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller # This is a controller now

  alias Wabanex.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end

  defp handle_response({:ok, data}, conn), do: render_response(conn, :ok, data)

  defp handle_response({:error, why}, conn), do: render_response(conn, :bad_request, why)

  defp render_response(conn, status, result) do
    conn
    |> put_status(status)
    |>  json(result)
  end

end
