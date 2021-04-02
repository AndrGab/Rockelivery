defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "Rua 01, 55",
      cep: "12345678",
      cpf: "00000000000",
      email: "rafael@banana.com.br",
      password: "123456",
      name: "Rafael"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Rua 01, 55",
      cep: "12345678",
      cpf: "00000000000",
      email: "rafael@banana.com.br",
      password: "123456",
      name: "Rafael",
      id: "910a2168-b747-4c35-9c5e-74912c89213f"
    }
  end
end
