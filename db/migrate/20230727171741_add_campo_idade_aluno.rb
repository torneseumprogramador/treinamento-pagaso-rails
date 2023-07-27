class AddCampoIdadeAluno < ActiveRecord::Migration[5.2]
  def change
    add_column :alunos, :idade, :integer, default: 18
  end
end
