class ChangeProductsTable < ActiveRecord::Migration
  def change
    change_column :products, :category, :integer
    change_column :products, :expansion, :integer
  end
end