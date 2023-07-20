class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :nome, limit: 150
      t.string :email, limit: 100
      t.text :obs

      t.timestamps
    end
  end
end
