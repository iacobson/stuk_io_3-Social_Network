class LikesController < ApplicationController
  before_action :authenticate_user!


  def create
    @like = current_user.likes.new(post_id: params[:post_id])
    if @like.save
      ###ADD PUBLIC ACTIVITY
      redirect_to :back, notice: "Post Liked !"
    else
      render post_path(@like.post), notice: "There was an error, please try again"
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to :back, notice: "Post Unliked !"
    else
      redirect_to :back, notice: "There was an error, please try again !"
    end
  end

  private
    # not using strong params because we would have to initiate @like in every controller


end
