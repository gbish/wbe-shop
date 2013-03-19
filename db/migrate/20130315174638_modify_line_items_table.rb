class ModifyLineItemsTable < ActiveRecord::Migration
  def change
    change_column_default :line_items, :quantity, default: 1
  end
end