defmodule RockeliveryWeb.ItemsView do
  use RockeliveryWeb, :view

  alias Rockelivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item Created!",
      item: item
    }
  end

  def render("item.json", %{item: %Item{} = item}), do: %{item: item}
end
