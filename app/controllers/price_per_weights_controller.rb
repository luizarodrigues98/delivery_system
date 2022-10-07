class PricePerWeightsController < ApplicationController
  before_action :authenticate_user!
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
      flash.now[:notice] = 'Não foi possível cadastrar uma configutação de preço por peso'
      render 'new'
    end
  end
  def edit
    
  end
  def update
    
  end
  def destroy
    
  end

  private
  def price_per_weight_params
    params.require(:price_per_weight).permit(:start_weight, :end_weight, :value_per_distance, :transport_type_id)
  end
end