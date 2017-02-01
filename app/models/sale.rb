class Sale < ActiveRecord::Base
  belongs_to :product

  validates :product, :cost, :date_of_purchase, presence: true
end
