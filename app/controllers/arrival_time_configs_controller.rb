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
      redirect_to _path(@transport_type.id), notice: 'Cadastrado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível cadastrar uma configuração de preço por peso'
      render 'new'
    end
  end

  private
  def arrival_time_params
    params.require(:arrival_time_configs).permit(:start_distance, :end_distance, :hours)
  end
end