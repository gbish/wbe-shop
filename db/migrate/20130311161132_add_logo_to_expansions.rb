class AddLogoToExpansions < ActiveRecord::Migration
  def change
    add_column :expansions, :logo, :string
  end
end