class Supplier < ApplicationRecord
  Product.where(supplier_id: id)
end
