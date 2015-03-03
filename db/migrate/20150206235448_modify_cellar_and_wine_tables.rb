class ModifyCellarAndWineTables < ActiveRecord::Migration
  def change
  	remove_column :wines, :name
  	remove_column :wines, :cellar_id
  end
end
