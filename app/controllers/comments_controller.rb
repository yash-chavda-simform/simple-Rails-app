class CommentsController < ApplicationController
  def index
  end

  def show
    @comment = Comment.where(event_id: params[:id])
    session[:current_event] = params[:id]
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(event_params)
    if @comment.save
      redirect_to events_path
    end
  end

  def add
    session[:event_id] = params[:id]    
    redirect_to new_comment_path
  end

  def like
    @l = Like.where(comment_id:params[:id],user_id:session[:user_id])
    if(@l.empty?)
      @like = Like.create(comment_id:params[:id],user_id:session[:user_id])
      if(@like)
        redirect_to comment_path(session[:current_event])  
      end
    else
      redirect_to comment_path(session[:current_event])
    end    
  end

  def unlike
    @l = Like.find_by(comment_id:params[:id],user_id:session[:user_id])
    if(@l)
      @l.destroy    
    end
    redirect_to comment_path(session[:current_event])
  end

  private
def event_params
  params.require(:comment).permit(:content, :user_id, :event_id)
end
  
end
