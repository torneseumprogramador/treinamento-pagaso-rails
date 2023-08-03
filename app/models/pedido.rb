class Pedido < ApplicationRecord
  belongs_to :cliente

  has_many :pedidos_produtos
end
