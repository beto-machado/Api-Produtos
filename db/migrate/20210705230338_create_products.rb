class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
