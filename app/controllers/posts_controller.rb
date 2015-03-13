class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  # the view for create will be in the views/users/show.html.slim
  # the @post = Post.new will be created in users_controller (show method)
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      # create public_activity when a new post is created
      @post.create_activity key: "post.created", owner: @post.user
      redirect_to user_path(@post.user.username), notice: "Post created"
    else
      redirect_to user_path(@post.user.username), notice: "Post NOT created, please retry!"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_path(@post.user.username), notice: "Post updated"
    else
      # if for any reason the post update was not saved, redirect again to the post update page
      # this is the views/posts/edith.html.slim
      redirect_to post_path(@post), notice: "Post was not updated. Please try again!"
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(@post.user.username), notice: "Post deleted"
  end



  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
