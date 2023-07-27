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
    end
end