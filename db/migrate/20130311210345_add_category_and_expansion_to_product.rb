class AddCategoryAndExpansionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category, :string
    add_column :products, :expansion, :string
  end
end
