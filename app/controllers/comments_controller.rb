class CommentsController < ApplicationController
  def index
  end

  def show
    @comments = Comment.where(event_id: params[:id])
    session[:current_event] = params[:id]
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(event_params)
    if @comment.save
      redirect_comments
    end
  end

  def add
    session[:event_id] = params[:id]    
    redirect_to new_comment_path
  end

  def like
    @likes = Like.where(comment_id:params[:id],user_id:session[:user_id])
    if(@likes.empty?)
      @like = Like.create(comment_id:params[:id],user_id:session[:user_id])
      if(@like)
        redirect_comments  
      end
    else
      redirect_comments
    end    
  end

  def unlike
    @like = Like.find_by(comment_id:params[:id],user_id:session[:user_id])
    if(@like)
      @like.destroy    
    end
    redirect_comments
  end

  def redirect_comments
    redirect_comments  
  end
  private
  def event_params
    params.require(:comment).permit(:content, :user_id, :event_id)
  end
end
