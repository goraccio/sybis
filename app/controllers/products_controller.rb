class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all.order(:id).page(params[:page]).per(15)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Новый продукт добавлен' }
        format.json { render :index, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_product
    @product = Product.find(params[:id, :name])
  end

  def product_params
    params.require(:product).permit(:name, :id)
  end
end
