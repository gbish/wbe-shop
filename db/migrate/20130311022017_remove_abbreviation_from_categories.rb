class RemoveAbbreviationFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :abbreviation
  end

  def down
  end
end
