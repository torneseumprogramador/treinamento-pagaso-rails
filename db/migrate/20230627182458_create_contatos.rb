class CreateContatos < ActiveRecord::Migration[5.2]
  def change
    create_table :contatos do |t|
      t.string :nome, limit: 150
      t.string :email, limit: 200
      t.text :observacao

      t.timestamps
    end
  end
end
