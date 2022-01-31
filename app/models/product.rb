class Product < ApplicationRecord
  include PgSearch::Model

  paginates_per 20
  max_paginates_per 100

  with_options presence: true do
    validates :name, uniqueness: true
    validates :description
    validates :price
    validates :quantity
  end

  scope :sorted, ->{ order(name: :asc) }

  pg_search_scope :search,
                  against: [
                    [:name, 'A'],
                    [:price, 'A'],
                  ]
end
