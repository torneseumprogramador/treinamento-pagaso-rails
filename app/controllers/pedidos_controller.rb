class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]

  # GET /pedidos or /pedidos.json
  def index
    sql = "
      select 
        clientes.nome, clientes.telefone, pedidos.id as pedido_id, pedidos.valor_total,
        produtos.nome as produto_nome, produtos.valor as produto_valor
      from pedidos
      inner join clientes on clientes.id = pedidos.cliente_id
      left join pedidos_produtos on pedidos_produtos.pedido_id = pedidos.id
      left join produtos on produtos.id = pedidos_produtos.produto_id
    "

    @pedidos = ActiveRecord::Base.connection.execute(sql)

    # #==== Union forma 1 =====
    # @union = ActiveRecord::Base.connection.execute("
    #   select id, nome, email as contato, created_at , updated_at, 'aluno' as tipo from alunos
    #   union
    #   select id, nome, telefone as contato, created_at , updated_at, 'cliente' as tipo from clientes
    #   order by id
    # ")


    # #==== Union forma 2 =====
    # alunos_tabela = Aluno.arel_table
    # clientes_tabela = Cliente.arel_table
    # clientes_alunos_tabela = alunos_tabela.project(alunos_tabela[:id], alunos_tabela[:nome])
    # alunos_clientes_tabela = clientes_tabela.project(clientes_tabela[:id], clientes_tabela[:nome])
    # union = clientes_alunos_tabela.union(alunos_clientes_tabela)
    # results = ActiveRecord::Base.connection.exec_query(union.to_sql)


    # #==== Union forma 3 =====
    # alunos_tabela_sql = Aluno.select(:id, :nome).to_sql
    # clientes_tabela_sql = Cliente.select(:id, :nome).to_sql
    # results = ActiveRecord::Base.connection.exec_query("#{alunos_tabela_sql} UNION #{clientes_tabela_sql}")



    # #======== group by forma 1 ============
    # sql = "
    #   select clientes.nome, sum(pedidos.valor_total) from pedidos
    #   inner join clientes on clientes.id = pedidos.cliente_id
    #   group by clientes.nome
    # "
    # group_by = ActiveRecord::Base.connection.execute(sql)


    # #======== group by forma 2 ============
    # results = Cliente.joins(:pedidos)
    #   .select('clientes.nome, SUM(pedidos.valor_total) as valor_total')
    #   .group('clientes.nome')


    # results.each do |result|
    #   puts("Nome: #{result.nome}")
    #   puts("Valor total: #{result.valor_total}")
    # end

    x = ""

    # @pedidos = Pedido.joins("inner join clientes on clientes.id = pedidos.cliente_id")
    # @pedidos = @pedidos.joins("left join pedidos_produtos on pedidos_produtos.pedido_id = pedidos.id")
    # @pedidos = @pedidos.joins("left join produtos on produtos.id = pedidos_produtos.produto_id")
    # @pedidos = @pedidos.where("pedidos.nome ilike ?", "'%#{params[:nome]}%')
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully created." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:cliente_id, :valor_total)
    end
end
