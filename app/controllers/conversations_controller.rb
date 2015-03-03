class ConversationsController < ApplicationController

	def create
		profile = params[:id]
		redirect_to new_conversation_message_path(profile)
	end

end
