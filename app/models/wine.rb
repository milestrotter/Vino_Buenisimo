class Wine < ActiveRecord::Base
	belongs_to :wine_type
	belongs_to :wine_category
	has_many :wine_cellars
	has_many :cellars, through: :wine_cellars
end
