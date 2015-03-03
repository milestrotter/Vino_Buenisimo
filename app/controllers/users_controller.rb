class UsersController < ApplicationController
  def index
  	@user = current_user
  	@cellars = Cellar.where(user_id: current_user.id)
  	@friends = User.find(current_user.id).friends
  	relationship = @friends.select(:created_at)

  	puts "\n\n\n#{relationship.each}\n\n\n"
  end

  def show
  	@user = current_user
  	@profile = User.find(params[:id])
  	@wines = @profile.cellars.where(classification: "Public").first.wines.all
  	@message
  end

end
