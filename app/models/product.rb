class Product < ApplicationRecord
  validates_presence_of :name, :category, :price, :sale_price
  validates_numericality_of :price, :sale_price
end
