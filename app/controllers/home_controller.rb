class HomeController < ApplicationController
    skip_before_action :autenticado
    
    def index
    end

    def sobre
    end
end
