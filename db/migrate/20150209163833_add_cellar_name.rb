class AddCellarName < ActiveRecord::Migration
  def change
  	add_column :cellars, :name, :string
  end
end
