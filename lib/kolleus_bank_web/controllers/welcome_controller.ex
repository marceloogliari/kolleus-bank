defmodule KolleusBankWeb.WelcomeController do
  use KolleusBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Bem vindo ao kolleus bank"})
  end
end
