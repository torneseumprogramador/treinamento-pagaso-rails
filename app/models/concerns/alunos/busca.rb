module Alunos
  module Busca
    extend ActiveSupport::Concern
  
    included do
      scope :by_nome, ->(nome) { where("lower(nome) like ?", "%#{nome.downcase}%") if nome.present? }
      scope :by_email, ->(email) { where("lower(email) like ?", "%#{email.downcase}%") if email.present? }
      scope :by_obs, ->(obs) { where("lower(obs) like ?", "%#{obs.downcase}%") if obs.present? }
    end
  end
end
  