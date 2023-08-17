json.extract! administrador, :id, :nome, :email, :senha, :salt, :created_at, :updated_at
json.url administrador_url(administrador, format: :json)
