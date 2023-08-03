class PedidosProduto < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
end
