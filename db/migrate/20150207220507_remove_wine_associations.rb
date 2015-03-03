class RemoveWineAssociations < ActiveRecord::Migration
  def change
  	remove_reference :wines, :wine_types, index: true
  	remove_reference :wines, :wine_categories, index: true

  	add_reference :wines, :wine_type, index: true
  	add_reference :wines, :wine_category, index: true
  end
end
