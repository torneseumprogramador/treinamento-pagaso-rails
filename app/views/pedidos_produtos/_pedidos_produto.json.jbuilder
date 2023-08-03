json.extract! pedidos_produto, :id, :pedido_id, :produto_id, :created_at, :updated_at
json.url pedidos_produto_url(pedidos_produto, format: :json)
