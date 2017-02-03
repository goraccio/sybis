class IndexController < ApplicationController
  include IndexHelper
  before_action :authenticate_user!

  def monthly_report
    @sales = Sale.all.group_by{ |s| s.date_of_purchase.beginning_of_month }
  end

  def product_cost_report
    @products = Sale.all.group_by{ |p| p.product}
  end

  def generate_monthly_report
    require 'spreadsheet'

    @sales = Sale.all.group_by{ |s| s.date_of_purchase.beginning_of_month }

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet name: 'Лист 1'
    sheet1.row(0).concat %w{Год Месяц Сумма}
    @sales.each_with_index do |(month, sales), i|
      sheet1[i+1, 0] = month.strftime("%Y")
      sheet1[i+1, 1] = month.strftime("%B")
      sheet1[i+1, 2] = total_sales(sales)
    end
    new_file = "#{Rails.root}/public/monthly_reports/monthly-report-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.xls"
    book.write new_file
    send_file new_file
  end
end
