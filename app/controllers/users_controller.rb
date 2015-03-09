class UsersController < ApplicationController
  #'show' method will have already @user variable defined
  before_action :set_user, only:[:show]

  def index
    @users = User.all
  end

  def show
  end

  private

  def set_user
    # find the user by username (not by ID)
    @user = User.find_by(username: params[:id])
  end
end
