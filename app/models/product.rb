class Product < ActiveRecord::Base
  has_many :sales

  validates :name, presence: true, uniqueness: true
end
