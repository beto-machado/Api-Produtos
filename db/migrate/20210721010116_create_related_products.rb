class CreateRelatedProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :related_products do |t|
      t.string :name
      t.decimal :price
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
