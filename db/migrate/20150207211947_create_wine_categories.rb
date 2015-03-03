class CreateWineCategories < ActiveRecord::Migration
  def change
    create_table :wine_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
