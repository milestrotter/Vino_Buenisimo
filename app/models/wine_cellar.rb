class WineCellar < ActiveRecord::Base
  belongs_to :cellar
  belongs_to :wine
end
