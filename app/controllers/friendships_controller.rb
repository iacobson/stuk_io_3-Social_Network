class FriendshipsController < ApplicationController
  #user must be logged in to have access to these methods
  before_action :authenticate_user!
  before_action :set_user, only: [:create]
  before_action :set_friendship, only: [:destroy, :accept]

  def create
    # request_friendship Method is defined in the users.rb Model
    @friendship = current_user.request_friendship(@user)
    redirect_to users_path, notice: "Friendship Requested to #{@user.username}"
  end

  def destroy
    # cancel_friendship Method is defined in the friendship.rb Model
    @friendship.cancel_friendship
    redirect_to users_path, notice: "Friendship Cancelled"
  end

  # created a custom PUT action in routes.rb named "accept"
  def accept
    # accept_friendship Method is defined in the friendship.rb Model
    @friendship.accept_friendship
    redirect_to users_path, notice: "Friendship Accepted"
  end


  private

  def set_user
    # :user_id is passed in from users_helper.rb
    @user = User.find(params[:user_id])
  end

  def set_friendship

    @friendship = Friendship.find(params[:id])
  end


end
