class ChangeWineCategory < ActiveRecord::Migration
  def change
  	remove_column :wines, :category
  	add_reference :wines, :wine_types, index: true
  end
end
