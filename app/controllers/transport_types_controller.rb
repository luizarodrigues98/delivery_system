class TransportTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin, except: [:index, :show]

  def index
    @transport_types = TransportType.all
  end

  def show
    @transport_type = TransportType.find(params[:id])    
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
    @transport_type = TransportType.find(params[:id])

  end

  def update
    @transport_type = TransportType.find(params[:id])    

    if @transport_type.update(transport_type_params)
      redirect_to transport_type_path(@transport_type.id), notice: 'Modalidade de transporte atualizado com sucesso'
    else 
      flash.now[:notice] = 'Não foi possível atualizar a modalidade de transporte'
      render 'edit'
    end
  end

  def activate
    @transport_type = TransportType.find(params[:id])
    @transport_type.update(active: true)
    redirect_to transport_type_path(@transport_type.id), notice: 'Status da modalidade: ativado'
  end

  def deactivate
    @transport_type = TransportType.find(params[:id])
    @transport_type.update(active: false)
    redirect_to transport_type_path(@transport_type.id), notice: 'Status da modalidade: desativado'
  end

  private

  def transport_type_params
    params.require(:transport_type).permit(:name, :min_distance, :max_distance, :min_weight, :max_weight , :fixed_rate, :active)
  end
end