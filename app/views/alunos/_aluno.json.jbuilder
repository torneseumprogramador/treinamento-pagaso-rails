json.extract! aluno, :id, :nome, :email, :obs, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
