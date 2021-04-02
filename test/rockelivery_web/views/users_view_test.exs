defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User Created!",
             user: %Rockelivery.User{
               address: "Rua 01, 55",
               age: 27,
               cep: "12345678",
               cpf: "00000000000",
               email: "rafael@banana.com.br",
               id: "910a2168-b747-4c35-9c5e-74912c89213f",
               inserted_at: nil,
               name: "Rafael",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } == response
  end
end
