module UsersHelper

	def profile_identity
		if current_user.id != @profile.id
			return false;
		else
			return true;
		end
	end
end
