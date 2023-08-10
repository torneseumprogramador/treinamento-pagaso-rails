class AlunoServiceQuery
    def self.busca_por_parametro(params = {})
        alunos = Aluno.all
        alunos = alunos.by_nome(params[:nome]) if params[:nome].present?
        alunos = alunos.by_email(params[:email]) if params[:email].present?
        alunos = alunos.by_obs(params[:obs]) if params[:obs].present?
        
        alunos = alunos.by_obs(params[:obs]) if params[:obs].present?
        alunos = alunos.by_obs(params[:obs]) if params[:obs].present?

        alunos = alunos.where("idade >= ?", params[:idade_ini]) if params[:idade_ini].present?
        alunos = alunos.where("idade <= ?", params[:idade_fim]) if params[:idade_fim].present?

        # alunos = alunos.where("idade between ? and ?", params[:idade_ini], params[:idade_fim]) if params[:idade_ini].present? && params[:idade_fim].present?

        alunos = alunos.where("created_at >= ?", params[:data_ini]) if params[:data_ini].present?
        alunos = alunos.where("created_at <= ?", params[:data_fim]) if params[:data_fim].present?

        if params[:ids].present?
            array_ids = params[:ids].split(",").map{|s| s.to_i}.find_all{|n| n > 0} rescue []
            alunos = alunos.where(id: array_ids)
        end

        # page = params[:page].to_i
        # page = 1 if page < 1
        # limit = 5
        # offset = limit * (page - 1)
        # alunos = alunos.limit(limit).offset(offset)

        # alunos = alunos.joins(:notas_alunos) # faz o join porém continua com N + 1
        # alunos = alunos.includes(:notas_alunos) # não faz o join porém faz um select in com os ids dos alunos (Um pouco melhor)
        # alunos = alunos.includes(:notas_alunos) # não faz o join porém faz um select in com os ids dos alunos (Um pouco melhor)
        alunos = alunos.includes(:notas_alunos).references(:notas_alunos) # com somente 1 query eu trago todos os dados da tabela relacional (melhor performance)

        alunos = alunos.paginate(page: params[:page], per_page: 10)
        
        # alunos = alunos.limit(5)
        alunos = alunos.order(id: :asc)

        puts "===================="
        puts alunos.to_sql
        puts "===================="

        alunos
    end
end