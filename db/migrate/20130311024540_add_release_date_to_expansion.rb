class AddReleaseDateToExpansion < ActiveRecord::Migration
  def change
    add_column :expansions, :release_date, :datetime
  end
end
