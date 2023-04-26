class PostCommentsController < ApplicationController
  before_action :require_rails_login
  
  def new
    @comment = PostComment.new
  end
  
  def create
    @comment = PostComment.new(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      render new, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:post_comment).permit(:comment, :rails_user_id, :post_id)
  end
end
