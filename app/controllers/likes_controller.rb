class LikesController < ApplicationController
  before_action :authenticate_user!


  def create
    @like = current_user.likes.new(post_id: params[:post_id])
    @post = @like.post

    respond_to do |format|
      if @like.save
        @like.create_activity key: "like.created", owner: @like.user, recipient: @like.post.user
        format.html {redirect_to :back, notice: "Post Liked !"}
        format.js
      else
        render post_path(@like.post), notice: "There was an error, please try again"
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    respond_to do |format|
      if @like.destroy
        format.html{redirect_to :back, notice: "Post Unliked !"}
        format.js
      else
        format.html{redirect_to :back, notice: "There was an error, please try again !"}
      end
    end
  end

  private
    # not using strong params because we would have to initiate @like in every controller


end
