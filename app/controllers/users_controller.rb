class UsersController < ApplicationController
  #'index' will be accesible only for logged in users
  before_action :authenticate_user!, only:[:index]
  #'show' method will have already @user variable defined
  before_action :set_user, only:[:show]

  def index
    # defining @users depending on their friendship status
    # params[:people] will be passed by the buttons on views/users/index file
    case params[:people]
    when "friends"
      #active_friends method defined in Model user.rb (already mapped in the Model)
      @users = current_user.active_friends
    #people that requested our friendship
    when "requests"
      #pending_friend_requests_from method defined in Model user.rb
      @users = current_user.pending_friend_requests_from.map(&:user)
    #people current_user requested to be friend to
    when "pending"
      #pending_friend_requests_to method defined in Model user.rb
      @users = current_user.pending_friend_requests_to.map(&:friend)
    else
      # display all users, except the current_user
      @users = User.where.not(id: current_user.id)
    end

  end

  def show
    # owner_id and recipient_id are created by public_activity gem based on info given in friendship_controller (accept Method)
    #sort public_acitivity by created_at with sql
    @activities = PublicActivity::Activity.where(owner_id: @user.id).order('created_at DESC')
    # creating new posts in views/users/show
    @post = Post.new
    # display user posts in views/users/show
    # sort posting by the newest created or updated dates
    @posts = @user.posts.order('max(created_at,updated_at) DESC')
  end

  private

  def set_user
    # find the user by username (not by ID)
    @user = User.find_by(username: params[:id])
  end
end
