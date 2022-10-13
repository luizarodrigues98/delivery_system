class ServiceOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_order, only: [:show, :destroy, :active, :edit, :update] 
  before_action :check_is_admin, except: [:index, :show]

  def index
    @service_orders = ServiceOrder.all
  end
  def show
    
  end
  def new
    @service_order = ServiceOrder.new
    @transport_types = TransportType.all
    @vehicles = Vehicle.all
  
  end

  def create
    @transport_types = TransportType.all
    @vehicles = Vehicle.all
    @service_order =ServiceOrder.new(service_order_params)
    if @service_order.save
      redirect_to service_order_path(@service_order), notice: 'Ordem de serviço cadastrada com sucesso'
    else
      flash.now[:notice] = 'Ordem de serviço não cadastrado'
      render 'new'
    end
  end
  def destroy
    @service.destroy
    redirect_to service_orders_path, notice: 'Ordem de serviço deletado com sucesso'
  end
  def edit
    @transport_types = TransportType.all
    @vehicles = Vehicle.all
  
  end
  def update
    @transport_types = TransportType.all
    @vehicles = Vehicle.all
    if @service.update(service_order_params)
      redirect_to service_order_path(@service.id), notice: 'Ordem de serviço atualizada'
    else
      flash.now[:notice] = 'Não foi possível atualizar'
    end
  end
  def active
    @service.update(status ==  'Ativo')
    redirect_to service_order_path(@service_order), notice: 'Status da ordem de serviço: ativado'
  end

  private
  def set_service_order
    @service = ServiceOrder.find(params[:id])
  end

  def service_order_params
    params.require(:service_order).permit(:address, :dimensions, :weight, :recipient, :status, 
                                          :recipient_address, :sku, :total_distance, :arrival_time,
                                          :total_value, :delivered_at, :transport_type_id, :vehicle_id, :reason)

  end
end