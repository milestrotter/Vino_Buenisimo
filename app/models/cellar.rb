class Cellar < ActiveRecord::Base
  belongs_to :user
  has_many :wine_cellars
  has_many :wines, through: :wine_cellars
end
