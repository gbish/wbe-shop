class AddExpansionsProductsTable < ActiveRecord::Migration
  def change
    create_table :expansions_products, :id => false do |t|
      t.integer :expansion_id
      t.integer :product_id
      t.timestamps
    end
  end
end