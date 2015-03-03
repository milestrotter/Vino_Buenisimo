class ChangeWineType < ActiveRecord::Migration
  def change
  	remove_column :wines, :color
  	add_reference :wines, :wine_categories, index: true
  end
end
