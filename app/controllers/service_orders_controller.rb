class ServiceOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_order, only: [:show, :destroy, :initiate, :edit, :update, :delivered] 
  before_action :check_is_admin, except: [:index, :show]

  def index
    @service_orders = ServiceOrder.all
  end

  def pending
    @service_orders = ServiceOrder.pending
  end

  def in_delivery
    @service_orders = ServiceOrder.in_delivery
  end

  def finished
    @service_orders = ServiceOrder.delivered_on_time
  end

  def show
    @transport_types = TransportType.for_service_order(@service_order.total_distance, @service_order.weight)
    if @service_order.status == "in_delivery"
      @delayed = (@service_order.initiated_at + @service_order.arrival_time.hours) < DateTime.now
    end
  end

  def new
    @service_order = ServiceOrder.new
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)
    if @service_order.save
      redirect_to service_order_path(@service_order), notice: 'Ordem de serviço cadastrada com sucesso'
    else
      flash.now[:notice] = 'Ordem de serviço não cadastrado'
      render 'new'
    end
  end

  def destroy
    @service_order.destroy
    redirect_to service_orders_path, notice: 'Ordem de serviço deletado com sucesso'
  end

  def edit; end

  def update
    if @service_order.update(service_order_params)
      redirect_to service_order_path(@service_order.id), notice: 'Ordem de serviço atualizada'
    else
      flash.now[:notice] = 'Não foi possível atualizar'
      render 'edit'
    end
  end

  def initiate
    unless params.key?(:transport_type_id)
      redirect_to service_order_path(@service_order), notice: 'Você deve selecionar uma Modalidade de Transporte!' 
      return
    end

    transport_type = TransportType.find(params[:transport_type_id])
    vehicle = transport_type.vehicles.active.where('max_weight >= ?', @service_order.weight).first
    vehicle.allocated!
    arrival_time_config = transport_type.arrival_time_configs.where("start_distance <= ? AND end_distance >= ?", @service_order.total_distance, @service_order.total_distance).first

    @service_order.update(status:  'in_delivery',
                          transport_type_id: transport_type.id, 
                          vehicle_id: vehicle.id, 
                          total_value: params[:total_value],
                          arrival_time: arrival_time_config.hours,
                          initiated_at: DateTime.now)

    redirect_to service_order_path(@service_order), notice: 'Status da ordem de serviço: Em entrega'
  end

  def delivered
    @service_order.vehicle.active!
    if (@service_order.initiated_at + @service_order.arrival_time.hours) > DateTime.now 
      @service_order.update(status: 'delivered_on_time', delivered_at: DateTime.now)
      redirect_to service_order_path(@service_order), notice: 'Status da ordem de serviço: Entregue no prazo'
    else
      @service_order.update(status: 'delivered_with_delay', delivered_at: DateTime.now, reason: params[:reason])
      redirect_to service_order_path(@service_order), notice: 'Status da ordem de serviço: Entregue com atraso'
    end

  end

  private


  def set_service_order
    @service_order = ServiceOrder.find(params[:id])
  end

  def service_order_params
    params.require(:service_order).permit(:address, :dimensions, :weight, :recipient, 
                                          :recipient_address, :sku, :total_distance,
                                          :transport_type_id, :reason)

  end
end