defmodule KolleusBank.Users.Create do
  alias KolleusBank.Users.User
  alias KolleusBank.Repo
  alias KolleusBank.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end
end
