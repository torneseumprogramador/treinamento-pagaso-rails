Rails.application.routes.draw do
  resources :alunos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get "sobre", to: "home#sobre"
  
  # get "contatos", to: "contato#lista"
  # get "contato", to: "contato#index"
  # post "contato/cadastrar", to: "contato#cadastrar"

  # post "contatos", to: "contato#cadastrar"
  # patch "contatos/:id", to: "contato#atualizar"
  
  # get "contato/:id/editar", to: "contato#editar"
  # put "contato/:id/atualizar", to: "contato#atualizar"
  # # get "contato/:id/excluir", to: "contato#excluir"
  # delete "contato/:id/excluir", to: "contato#excluir"


  resources :contatos
  
end
