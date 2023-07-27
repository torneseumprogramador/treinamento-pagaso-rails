class CreateNotasAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :notas_alunos do |t|
      t.references :aluno, foreign_key: true
      t.float :nota
      t.text :obs

      t.timestamps
    end
  end
end
