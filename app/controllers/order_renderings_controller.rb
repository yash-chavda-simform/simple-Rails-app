class OrderRenderingsController < ApplicationController
  before_action :authenticate_user_rendering!
  layout :set_layout
  def index
    @orders = OrderRendering.all  
  end
end
