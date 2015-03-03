class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :winery
      t.string :type
      t.integer :year
      t.float :price
      t.string :category
      t.references :cellar, index: true

      t.timestamps
    end
  end
end
