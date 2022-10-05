class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, only: [:show, :edit, :update, :active, :maintenance] 
  before_action :check_is_admin, except: [:index, :show]

  def index
    @vehicles = Vehicle.all
  end
  
  def show
  end
  
  def active
    @vehicle.update(status: 0)
    redirect_to vehicle_path(@vehicle.id), notice: 'Status do veiculo: ativado'
  end
  def maintenance
    @vehicle.update(status: 2)
    redirect_to vehicle_path(@vehicle.id), notice: 'Status do veiculo: em manutenção'
  end

  def new
    @vehicle = Vehicle.new
    @transport_types = TransportType.all

  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.status = 0
    if @vehicle.save!
      redirect_to vehicle_path(@vehicle), notice: 'Veiculo registrado com sucesso'
    else
      @transport_types = TransportType.all
      flash.now[:notice] = 'Não foi possível registrar o veiculo'
      render 'new'
    end
  end
  private

  def vehicle_params
    params.require(:vehicle).permit(:plate, :model, :status, :max_weight, :fabrication_year, :transport_type_id)
  end
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])    
  end
end