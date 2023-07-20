class ContatosController < ApplicationController
    def new
    end

    def create
        nome = params["contato"]["nome"]
        email = params["contato"]["email"]
        observacao = params["contato"]["observacao"]
        
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

    def update
        @contato = Contato.find(params["id"])

        @contato.nome = params["contato"]["nome"]
        @contato.email = params["contato"]["email"]
        @contato.observacao = params["contato"]["observacao"]
        
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
        redirect_to "/contatos"
        # render json: @contato.to_json, status: 200
    end

    def index
        @contatos = Contato.all.order(id: :asc)
        respond_to do |format|
            format.html
            format.json { render json: @contatos }
        end
    end

    def edit
        @contato = Contato.find(params[:id])
    end

    def destroy
        contato = Contato.find(params["id"])
        contato.destroy

        flash["success"] = "Contato excluido com sucesso"
        render json: {}, status: 204
    end
end
