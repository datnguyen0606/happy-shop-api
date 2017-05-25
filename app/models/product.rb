class Product < ApplicationRecord
  validates_presence_of :name, :category, :price, :sale_price
  validates_numericality_of :price, :sale_price

  LIMIT = 20
  OFFSET = 0

  def self.get_by_filter(category, limit, offset, order)
    products = Product.all
    unless category.blank?
      products = products.where(category: category)
    end

    total = products.count
    if not order.blank? and ["asc", "desc"].include?(order)
      products = products.order(price: order)
    end

    limit ||= LIMIT
    offset ||= OFFSET
    products = products.limit(limit).offset(offset)
    return total, products
  end
end
