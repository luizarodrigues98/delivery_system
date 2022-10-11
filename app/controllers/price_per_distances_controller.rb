class PricePerDistancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_price_distance, only: :destroy

  def new
    @price_per_distance = PricePerDistance.new
    @transport_type = TransportType.find(params[:transport_type_id])
  end

  def create
    @transport_type = TransportType.find(params[:transport_type_id])
    @price_per_distance = PricePerDistance.new(price_per_distance_params)
    @price_per_distance.transport_type_id = @transport_type.id

    if @price_per_distance.save
      redirect_to transport_type_path(@transport_type.id), notice: 'Cadastrado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível cadastrar uma configuração de preço por distância'
      render 'new'
    end
  end
  
  def destroy
    @transport_type = @price_per_distance.transport_type
    @price_per_distance.destroy

    redirect_to transport_type_path(@transport_type.id), notice: 'Intervalo removido com sucesso'
  end

  private

  def set_price_distance
    @price_per_distance = PricePerDistance.find(params[:id])
  end

  def price_per_distance_params
    params.require(:price_per_distance).permit(:start_distance, :end_distance, :rate)
  end
end