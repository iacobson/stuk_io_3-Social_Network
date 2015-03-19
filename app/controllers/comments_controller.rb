class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:create, :edit, :update, :destroy]



  # the view for create will be in the views/comments/show.html.slim
  def create
    # use BUILD instead of NEW
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      # create public_activity when a new comment is created
      @comment.create_activity key: "comment.posted", owner: @comment.user, recipient: @post.user
      redirect_to post_path(@post), notice: "Comment posted"
    else
      redirect_to post_path(@post), notice: "Post NOT created, please retry!"
    end

  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post) , notice: "Comment updated"
    else
      redirect_to edit_comment_path(@comment, post_id: @post.id) , notice: "Comment was not updated. Please try again!"
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), notice: "Comment deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end


end
