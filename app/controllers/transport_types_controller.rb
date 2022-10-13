class TransportTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin, except: [:index, :show]
  before_action :set_transport_type,  only: [:show, :edit, :update, :activate, :deactivate, :destroy] 
  def index
    @transport_types = TransportType.all
  end

  def show
    @price_per_weights = @transport_type.price_per_weights.order(:start_weight)
    @price_per_distances = @transport_type.price_per_distances.order(:start_distance)
    @arrival_times = @transport_type.arrival_time_configs.order(:start_distance)
  end

  def new
    @transport_type = TransportType.new
  end

  def create
    @transport_type =TransportType.new(transport_type_params)
    if @transport_type.save
      redirect_to transport_types_path,  notice: 'Modalidade de transporte cadastrado com sucesso.'
    else
      flash.now[:notice] = 'Modalidade de transporte não cadastrado'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @transport_type.update(transport_type_params)
      redirect_to transport_type_path(@transport_type.id), notice: 'Modalidade de transporte atualizado com sucesso'
    else 
      flash.now[:notice] = 'Não foi possível atualizar a modalidade de transporte'
      render 'edit'
    end
  end

  def activate
    @transport_type.update(active: true)
    redirect_to transport_type_path(@transport_type.id), notice: 'Status da modalidade: ativado'
  end

  def deactivate
    @transport_type.update(active: false)
    redirect_to transport_type_path(@transport_type.id), notice: 'Status da modalidade: desativado'
  end

  def destroy
    @transport_type.destroy 
    redirect_to transport_types_path, notice: 'Modalidade de Transporte removido com sucesso'        
  end

  private
  def sanitize_fixed_rate
    params[:transport_type][:fixed_rate] = params[:transport_type][:fixed_rate].to_f * 100
  end
  def set_transport_type
    @transport_type = TransportType.find(params[:id])
  end
  def transport_type_params
    sanitize_fixed_rate
    params.require(:transport_type).permit(:name, :min_distance, :max_distance, :min_weight, :max_weight , :fixed_rate, :active)
  end
end