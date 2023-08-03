require 'test_helper'

class PedidosProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedidos_produto = pedidos_produtos(:one)
  end

  test "should get index" do
    get pedidos_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_pedidos_produto_url
    assert_response :success
  end

  test "should create pedidos_produto" do
    assert_difference('PedidosProduto.count') do
      post pedidos_produtos_url, params: { pedidos_produto: { pedido_id: @pedidos_produto.pedido_id, produto_id: @pedidos_produto.produto_id } }
    end

    assert_redirected_to pedidos_produto_url(PedidosProduto.last)
  end

  test "should show pedidos_produto" do
    get pedidos_produto_url(@pedidos_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedidos_produto_url(@pedidos_produto)
    assert_response :success
  end

  test "should update pedidos_produto" do
    patch pedidos_produto_url(@pedidos_produto), params: { pedidos_produto: { pedido_id: @pedidos_produto.pedido_id, produto_id: @pedidos_produto.produto_id } }
    assert_redirected_to pedidos_produto_url(@pedidos_produto)
  end

  test "should destroy pedidos_produto" do
    assert_difference('PedidosProduto.count', -1) do
      delete pedidos_produto_url(@pedidos_produto)
    end

    assert_redirected_to pedidos_produtos_url
  end
end
