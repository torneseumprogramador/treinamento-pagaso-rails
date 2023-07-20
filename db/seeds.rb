# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Criação de 30 clientes de exemplo
30.times do |n|
    nome = Faker::Name.name
    email = Faker::Internet.email
    observacao = Faker::Lorem.paragraph
    
    Contato.create!(
      nome: nome,
      email: email,
      observacao: observacao,
      created_at: Time.current,
      updated_at: Time.current
    )
end
  