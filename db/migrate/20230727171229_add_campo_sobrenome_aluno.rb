class AddCampoSobrenomeAluno < ActiveRecord::Migration[5.2]
  def change
    add_column :alunos, :sobrenome, :string, limit: 100
  end
end
