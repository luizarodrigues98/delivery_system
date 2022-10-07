class PricePerWeightsController < ApplicationController
  before_action :authenticate_user!
  def new
    @price_per_weights = PricePerWeight.new
  end
  def create
    @price_per_weights = PricePerWeight.new
    
  end
  def edit
    
  end
  def update
    
  end
  def destroy
    
  end
end