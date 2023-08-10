class Pedido < ApplicationRecord
  belongs_to :cliente
  attr_accessor :cliente_nome

  has_many :pedidos_produtos
end
