class PedidosProdutosController < ApplicationController
  before_action :set_pedidos_produto, only: %i[ show edit update destroy ]

  # GET /pedidos_produtos or /pedidos_produtos.json
  def index
    @pedidos_produtos = PedidosProduto.all
  end

  # GET /pedidos_produtos/1 or /pedidos_produtos/1.json
  def show
  end

  # GET /pedidos_produtos/new
  def new
    @pedidos_produto = PedidosProduto.new
  end

  # GET /pedidos_produtos/1/edit
  def edit
  end

  # POST /pedidos_produtos or /pedidos_produtos.json
  def create
    @pedidos_produto = PedidosProduto.new(pedidos_produto_params)

    respond_to do |format|
      if @pedidos_produto.save
        format.html { redirect_to pedidos_produto_url(@pedidos_produto), notice: "Pedidos produto was successfully created." }
        format.json { render :show, status: :created, location: @pedidos_produto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedidos_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos_produtos/1 or /pedidos_produtos/1.json
  def update
    respond_to do |format|
      if @pedidos_produto.update(pedidos_produto_params)
        format.html { redirect_to pedidos_produto_url(@pedidos_produto), notice: "Pedidos produto was successfully updated." }
        format.json { render :show, status: :ok, location: @pedidos_produto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedidos_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos_produtos/1 or /pedidos_produtos/1.json
  def destroy
    @pedidos_produto.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_produtos_url, notice: "Pedidos produto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedidos_produto
      @pedidos_produto = PedidosProduto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedidos_produto_params
      params.require(:pedidos_produto).permit(:pedido_id, :produto_id)
    end
end
