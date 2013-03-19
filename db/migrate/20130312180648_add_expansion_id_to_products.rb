class AddExpansionIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :expansion_id, :integer
  end
end
