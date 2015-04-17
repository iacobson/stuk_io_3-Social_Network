class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]




  # the view for create will be in the views/comments/show.html.slim
  def create
    # use BUILD instead of NEW
    # comment_params already includes post_id through the hidden field

    @comment = current_user.comments.build(comment_params)
    byebug
    if @comment.save
      # create public_activity when a new comment is created
      @comment.create_activity key: "comment.posted", owner: @comment.user, recipient: @comment.post.user
      redirect_to post_path(@comment.post), notice: "Comment posted"
    else
      redirect_to post_path(@comment.post), notice: "Post NOT created, please retry!"
    end

  end

  def edit
    @post = @comment.post
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post) , notice: "Comment updated"
    else
      redirect_to edit_comment_path(@comment) , notice: "Comment was not updated. Please try again!"
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post), notice: "Comment deleted"
  end




  private

    def comment_params
      params.require(:comment).permit(:comment_content, :post_id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end




end
