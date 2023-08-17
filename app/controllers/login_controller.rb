class LoginController < ApplicationController
    skip_before_action :autenticado
    
    layout 'login'
    
    def index
    end

    def logar
        nao_logado = false
        adms = Administrador.where(email: params[:email])
        nao_logado = true if adms.count == 0

        adm = adms.first

        nao_logado = true if adm && adm.senha != Digest::SHA1.hexdigest(params[:senha] + adm.salt)

        if nao_logado
            flash["error"] = "Login ou senha inválidos"
            return redirect_to "/login"
        end

        adm_info = {
            id: adm.id,
            nome: adm.nome,
            email: adm.email
        }

        time = params[:lembrar] ? 1.year.from_now : 1.hour.from_now

        cookies[:adm] = {
            value: adm_info.to_json,
            expires: time
        }

        adm.salt = rand.to_s
        adm.senha = Digest::SHA1.hexdigest(params[:senha] + adm.salt)
        adm.save!
        
        return redirect_to "/alunos"
    end
end
