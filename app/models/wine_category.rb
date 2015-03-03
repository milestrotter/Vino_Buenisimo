class WineCategory < ActiveRecord::Base
	has_many :wines
end
