class MessagesController < ApplicationController
  def index
  	@user = current_user
  	@messages = User.find(current_user.id).conversations.all
  end

  def show
  	@user = current_user
  	@conversation = Conversation.find(params[:id])
  	@messages = @conversation.messages.all
  end

  def new
  	@user = current_user
  	puts "\n\n\n#{params}\n\n\n"
  	@conversation = Conversation.last
  	puts "\n\n\n#{@conversation.id}\n\n\n"
  	# @messages = @conversation.messages.all
  	@message = Message.new
  end

  def create
  	puts "\n\n\nThese are the parameters#{params}\n\n\n"
  	User.find(params[:message][:profile_id]).conversations.create(subject:params[:message][:subject])
  	conversation = Conversation.last
  	UserConversation.create(user_id:params[:message][:user_id], conversation_id:conversation.id)
  	message = Conversation.find(conversation.id).messages.create(create_message_params)
  	redirect_to message_path(conversation.id)
  	# redirect_to :back
  end

  def edit
  	@user = current_user
  	@conversation = Conversation.find(params[:id])
  	@messages = @conversation.messages.all
  	@message = Message.new
  end

  def update
  	puts "\n\n\nI am in the update controller\n\n #{params}\n\n\n"
  	message = Conversation.find(params[:message][:conversation_id]).messages.create(message_params)
  	redirect_to message_path(params[:message][:conversation_id])
  end

  private
  	def message_params
  		params.require(:message).permit(:conversation_id, :user_id, :content)
  	end
  	def create_message_params
  		params.require(:message).permit(:user_id, :content)
  	end
end
