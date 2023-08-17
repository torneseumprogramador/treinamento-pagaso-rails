class Administrador < ApplicationRecord
    before_create do
        self.salt = rand.to_s if self.salt.blank?
    end

    before_save do
        self.senha = Digest::SHA1.hexdigest(self.senha + self.salt) if !is_encrypted?(self.senha)
    end

    private 
        def is_encrypted?(string)
            # Lista de algoritmos de hash para verificar
            hash_algorithms = [
                Digest::SHA1,
                Digest::SHA256
                # Adicione mais algoritmos aqui, se necessário
            ]
            
            hash_algorithms.any? { |algorithm| string.length == algorithm.new.hexdigest.length }
        end
end
