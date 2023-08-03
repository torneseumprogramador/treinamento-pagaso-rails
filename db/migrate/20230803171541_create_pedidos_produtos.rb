class CreatePedidosProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos_produtos do |t|
      t.references :pedido, foreign_key: true
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
