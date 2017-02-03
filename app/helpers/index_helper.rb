module IndexHelper
  def total_sales(sales)
    sc = 0
    sales.map{|sale| sc += sale.cost}
    sc
  end
end
