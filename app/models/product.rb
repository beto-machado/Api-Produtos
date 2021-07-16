class Product < ApplicationRecord
  paginates_per 20
  max_paginates_per 100

  with_options presence: true do
    validates :name, uniqueness: true
    validates :description
    validates :price
    validates :quantity
  end
end
