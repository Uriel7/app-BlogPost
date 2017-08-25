class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.new
  end

  def create
   head :unprocessable_entity unless @comment = @post.comments.create(comment_params)
  end

  def edit
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id]) if @post
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
