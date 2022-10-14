class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, only: [:show, :edit, :update, :active, :maintenance, :destroy] 
  before_action :check_is_admin, except: [:index, :show, :search]

  def index
    @vehicles = Vehicle.all
  end
  
  def show
    @transport_type = @vehicle.transport_type
  end
  
  def active
    @vehicle.update(status: 0)
    redirect_to vehicle_path(@vehicle.id), notice: 'Status do veículo: ativado'
  end
  def maintenance
    @vehicle.update(status: 2)
    redirect_to vehicle_path(@vehicle.id), notice: 'Status do veículo: em manutenção'
  end

  def new
    @vehicle = Vehicle.new
    @transport_types = TransportType.all

  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.status = 0
    if @vehicle.save
      redirect_to vehicle_path(@vehicle), notice: 'Veículo registrado com sucesso'
    else
      @transport_types = TransportType.all
      flash.now[:notice] = 'Não foi possível registrar o veículo'
      render 'new'
    end
  end

  def edit
    @transport_types = TransportType.all
  end
  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Veículo atualizado com sucesso'
    else
      @transport_types = TransportType.all
      flash.now[:notice] = 'Não foi possível atualizar o veiculo'
      render 'edit'
    end
  end

  def search
    @plate = params["query"]
    @vehicles = Vehicle.where("plate like ?", "%#{@plate}%")
  end

  def destroy
    @vehicle.destroy 
    redirect_to vehicles_path, notice: 'Veículo removido com sucesso'        
  end
  private

  def vehicle_params
    params.require(:vehicle).permit(:plate, :brand ,:model, :status, :max_weight, :fabrication_year, :transport_type_id)
  end
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])    
  end
end