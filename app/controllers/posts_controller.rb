class PostsController < ApplicationController
  before_action :require_login
  before_action :find_post, only: [:show, :edit, :update, :destroy, :view_comment, :like_post]
  def index
    @posts = Post.all
  end

  def show; end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_yourpost_path }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_yourpost_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @post.delete
    redirect_to posts_yourpost_path
  end

  def your_post
    @posts = current_user.posts
  end

  def view_comment
    @comments = @post.post_comments
  end

  def like_post
    if current_user.liked_posts.include?(@post)
      current_user.liked_posts.delete(@post)  
    else
      current_user.liked_posts << @post
    end
    redirect_to posts_path
  end 

  private
  def post_params
    params.require(:post).permit(:title, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end  
end
