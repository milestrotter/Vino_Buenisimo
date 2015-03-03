class CreateCellars < ActiveRecord::Migration
  def change
    create_table :cellars do |t|
      t.string :type
      t.integer :size
      t.references :user, index: true

      t.timestamps
    end
  end
end
