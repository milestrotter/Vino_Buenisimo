class FriendsController < ApplicationController
  def index
  	@user = current_user
  	all_users = User.all
  	@myusers = User.find(current_user.id).friends.all
  	@all_other_users = all_users - @myusers - [current_user]
  end

  def create
  	friendship1 = Friendship.create(friend_id: params[:id], user_id: current_user.id)
  	friendship2 = Friendship.create(friend_id: current_user.id, user_id: params[:id])
  	redirect_to :back
  end

  def destroy
  	friendship1 = Friendship.where(friend_id: params[:id], user_id: current_user.id)
  	friendship2 = Friendship.where(friend_id: current_user.id, user_id: params[:id])
  	puts "\n\n\nThis is the friendship: #{friendship1[0].id}\n\n\n"
  	Friendship.find(friendship1[0].id).destroy
  	Friendship.find(friendship2[0].id).destroy
  	redirect_to :back
  end
end
