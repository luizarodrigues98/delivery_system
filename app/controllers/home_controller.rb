class HomeController < ApplicationController
  layout 'public', except: :index
  before_action :authenticate_user!, only: :index

  def index
    @user = current_user
    @service_orders = ServiceOrder.pending

  end

  def tracking
    if params[:code] != nil
      @service_order = ServiceOrder.find_by(tracking_code: params[:code])
    end
  end

  def search
    if params[:code] == ''
      redirect_to tracking_path, notice: 'É necessário preencher o código'
      return 
    else
      @service_order = ServiceOrder.find_by(tracking_code: params[:code])
      if @service_order 
        redirect_to tracking_path(code: params[:code])
      else
        redirect_to tracking_path, notice: 'Código não encontrado'
      end
    end
  end
end
