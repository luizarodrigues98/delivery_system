class PricePerWeightsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_price_weight, only: [:edit, :destroy]
  def new
    @price_per_weight = PricePerWeight.new
    @transport_type = TransportType.find(params[:transport_type_id])

  end
  def create
    @transport_type = TransportType.find(params[:transport_type_id])
    @price_per_weight = PricePerWeight.new(price_per_weight_params)
    @price_per_weight.transport_type_id = @transport_type.id
    if @price_per_weight.save
      redirect_to transport_type_path(@transport_type.id), notice: 'Cadastrado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível cadastrar uma configuração de preço por peso'
      render 'new'
    end
  end
  def edit
    @transport_type = TransportType.find(params[:transport_type_id])

  end
  def update
    @transport_type = TransportType.find(params[:transport_type_id])
    @price_per_weight.transport_type_id = @transport_type.id
    if @price_per_weight.update(price_per_weight_params)
      redirect_to transport_type_path(@transport_type.id), notice: 'Atualizado com sucesso'      
    else
      flash.now[:notice] = 'Não foi possível atualizar uma configuração de preço por peso'
      render 'edit'
    end
  end
  def destroy
    @transport_type = TransportType.find(params[:id])
    @price_per_weight.destroy
    redirect_to transport_type_path(@transport_type.id), notice: 'Intervalo removido com sucesso'        

  end

  private
  def set_price_weight
    @price_per_weight = PricePerWeight.find(params[:id])
  end
  def price_per_weight_params
    params.require(:price_per_weight).permit(:start_weight, :end_weight, :value_per_distance, :transport_type_id)
  end
end