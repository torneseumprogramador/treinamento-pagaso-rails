class CreateAdministradors < ActiveRecord::Migration[5.2]
  def change
    create_table :administradors do |t|
      t.string :nome, limit: 100
      t.string :email, limit: 200
      t.string :senha, limit: 200
      t.string :salt, limit: 200

      t.timestamps
    end
  end
end
