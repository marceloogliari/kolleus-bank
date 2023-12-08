defmodule KolleusBankWeb.UsersJSON do
  alias KolleusBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User criado com sucesso!",
      data: data(user)
    }
  end

  def update(%{user: user}) do
    %{
      message: "User Alterado com sucesso!",
      data: data(user)
    }
  end

  def delete(%{user: user}), do: %{data: data(user)}
  def get(%{user: user}), do: %{data: user}

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cep: user.cep
    }
  end
end
