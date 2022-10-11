class ArrivalTimeConfigsController < ApplicationController
  before_action :authenticate_user!
 
  def new
    @arrival_time = ArrivalTimeConfig.new
    @transport_type = TransportType.find(params[:transport_type_id])
  end

  def create
    @transport_type = TransportType.find(params[:transport_type_id])
    @arrival_time = ArrivalTimeConfig.new(arrival_time_params)
    @arrival_time.transport_type_id = @transport_type.id
    
    if @arrival_time.save
      redirect_to transport_type_path(@transport_type.id), notice: 'Cadastrado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível cadastrar uma configuração de prazo'
      render 'new'
    end
  end

  def destroy
    @arrival_time = ArrivalTimeConfig.find(params[:id])
    @transport_type = @arrival_time.transport_type
    @arrival_time.destroy
    redirect_to transport_type_path(@transport_type.id), notice: 'Prazo removido com sucesso'
  end

  private
  def arrival_time_params
    params.require(:arrival_time_config).permit(:start_distance, :end_distance, :hours)
  end
end