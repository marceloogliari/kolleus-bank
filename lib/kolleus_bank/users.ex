defmodule KolleusBank.Users do
  alias KolleusBank.Users.Create
  alias KolleusBank.Users.Get
  alias KolleusBank.Users.Update
  alias KolleusBank.Users.Delete

  defdelegate create(params), to: Create, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate get(id), to: Get, as: :call
end
