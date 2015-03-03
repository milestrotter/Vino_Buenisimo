class ChangeTypeColumns < ActiveRecord::Migration
  def change

  	rename_column :cellars, :type, :classification

  	rename_column :wines, :type, :color
  end
end
