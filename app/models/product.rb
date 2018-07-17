class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  def is_discounted?
    price < 20
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end
end
