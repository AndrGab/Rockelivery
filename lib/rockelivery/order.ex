defmodule Rockelivery.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rockelivery.{User, Item}
  alias Ecto.Enum

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @payment_methods [:cash, :credit_card, :debit_card, :pix]

  @required_params [:address, :comments, :payment_method, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id, :items]}

  schema "orders" do
    field :address, :string
    field :comments, :string
    field :payment_method, Enum, values: @payment_methods

    many_to_many :items, Item, join_through: "orders_items"
    belongs_to :user, User

    timestamps()
  end

  def changeset(params, items) do
    %__MODULE__{}
    |> changes(params, @required_params, items)
  end

  def changeset(struct, params, items) do
    struct
    |> changes(params, @required_params, items)
  end

  defp changes(struct, params, fields, items) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
    |> put_assoc(:items, items)
    |> validate_length(:address, min: 10)
    |> validate_length(:comments, min: 6)
  end
end
