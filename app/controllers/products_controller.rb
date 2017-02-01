class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all.page(params[:page]).per(15)
  end
end
