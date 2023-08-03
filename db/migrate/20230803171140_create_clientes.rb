class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nome, limit: 150
      t.string :telefone, limit: 25

      t.timestamps
    end
  end
end
