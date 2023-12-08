defmodule KolleusBankWeb.UsersControllerTest do
  use KolleusBankWeb.ConnCase

  alias KolleusBank.Users
  alias Users.User

  describe "create/2" do
    test "sucessfully creates an user", %{conn: conn} do
      params = %{
        name: "Marcelo",
        cep: "85530000",
        email: "marcelo@marcelo.com",
        password: "123456"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "cep" => "85530000",
                 "email" => "marcelo@marcelo.com",
                 "id" => _id,
                 "name" => "Marcelo"
               },
               "message" => "User criado com sucesso!"
             } = response
    end

    test "when there are invalid prams, returns an error", %{conn: conn} do
      params = %{
        name: nil,
        cep: "8",
        email: "marcelo@marcelo.com",
        password: "12345678"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "sucessfully deletes an user", %{conn: conn} do
      params = %{
        name: "Marcelo",
        cep: "85530000",
        email: "marcelo@marcelo.com",
        password: "123456"
      }

      {:ok, %User{"id" => id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "cep" => "85530000",
          "email" => "marcelo@marcelo.com",
          "id" => id,
          "name" => "Marcelo"
        }
      }

      assert response == expected_response
    end
  end
end
