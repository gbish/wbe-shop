class CreateExpansions < ActiveRecord::Migration
  def change
    create_table :expansions do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
