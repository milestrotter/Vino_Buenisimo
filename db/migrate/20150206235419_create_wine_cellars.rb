class CreateWineCellars < ActiveRecord::Migration
  def change
    create_table :wine_cellars do |t|
      t.references :cellar, index: true
      t.references :wine, index: true

      t.timestamps
    end
  end
end
