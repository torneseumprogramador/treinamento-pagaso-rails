class ApplicationController < ActionController::Base
    before_action :autenticado


    private 
        def autenticado
            return if cookies[:adm].present?
            return redirect_to "/login"
        end
end
