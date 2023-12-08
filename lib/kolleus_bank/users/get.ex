defmodule KolleusBank.Users.Get do
  alias KolleusBank.Users.User
  alias KolleusBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
