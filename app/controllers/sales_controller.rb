class SalesController < ApplicationController
  before_action :authenticate_user!
  def index
    @sales = Sale.all.page(params[:page]).per(50)
  end
end
