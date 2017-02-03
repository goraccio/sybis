class SalesController < ApplicationController
  before_action :authenticate_user!
  def index
    @sales = Sale.all.order(:id).page(params[:page]).per(50)
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sales_path, notice: 'Новая сделка добавлена' }
        format.json { render :index, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_sale
    @sale = Sale.find(params[:product_id, :id, :cost, :date_of_purchase])
  end

  def sale_params
    params.require(:sale).permit(:product_id, :id, :cost, :date_of_purchase)
  end
end
