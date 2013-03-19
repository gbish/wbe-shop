class ChangeReleaseDateToDate < ActiveRecord::Migration
  def change
    change_column :expansions, :release_date, :date
  end
end