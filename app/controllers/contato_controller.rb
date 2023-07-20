class ContatoController < ApplicationController
    def index
    end

    def cadastrar
        nome = params["nome"]
        email = params["email"]
        observacao = params["observacao"]
        
        if nome.blank?
            flash["error"] = "O nome é obrigatório"
            return render "index"
        end

        if email.blank?
            flash["error"] = "O email é obrigatório"
            return render "index"
        end

        Contato.create!(nome: nome, email:email, observacao:observacao)

        flash["success"] = "Contato cadastrado com sucesso"
        redirect_to "/contatos"
    end

    def atualizar
        @contato = Contato.find(params["id"])

        @contato.nome = params["nome"]
        @contato.email = params["email"]
        @contato.observacao = params["observacao"]
        
        if @contato.nome.blank?
            flash["error"] = "O nome é obrigatório"
            return render "editar"
        end

        if @contato.email.blank?
            flash["error"] = "O email é obrigatório"
            return render "editar"
        end

        @contato.save!

        flash["success"] = "Contato atualizado com sucesso"
        render json: @contato.to_json, status: 200
    end

    def lista
        @contatos = Contato.all.order(id: :asc)
        respond_to do |format|
            format.html
            format.json { render json: @contatos }
        end
    end

    def editar
        @contato = Contato.find(params[:id])
    end

    def excluir
        contato = Contato.find(params["id"])
        contato.destroy

        flash["success"] = "Contato excluido com sucesso"
        render json: {}, status: 204
    end
end
