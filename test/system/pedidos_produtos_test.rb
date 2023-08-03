require "application_system_test_case"

class PedidosProdutosTest < ApplicationSystemTestCase
  setup do
    @pedidos_produto = pedidos_produtos(:one)
  end

  test "visiting the index" do
    visit pedidos_produtos_url
    assert_selector "h1", text: "Pedidos Produtos"
  end

  test "creating a Pedidos produto" do
    visit pedidos_produtos_url
    click_on "New Pedidos Produto"

    fill_in "Pedido", with: @pedidos_produto.pedido_id
    fill_in "Produto", with: @pedidos_produto.produto_id
    click_on "Create Pedidos produto"

    assert_text "Pedidos produto was successfully created"
    click_on "Back"
  end

  test "updating a Pedidos produto" do
    visit pedidos_produtos_url
    click_on "Edit", match: :first

    fill_in "Pedido", with: @pedidos_produto.pedido_id
    fill_in "Produto", with: @pedidos_produto.produto_id
    click_on "Update Pedidos produto"

    assert_text "Pedidos produto was successfully updated"
    click_on "Back"
  end

  test "destroying a Pedidos produto" do
    visit pedidos_produtos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pedidos produto was successfully destroyed"
  end
end
