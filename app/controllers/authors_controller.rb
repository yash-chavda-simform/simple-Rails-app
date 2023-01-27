class AuthorsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @authors=Author.all
  end

  def show; end
  
  def new
    @author=Author.new
  end
  
  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to :action => 'index'
    end
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to :action => 'index'
    end 
  end

  def destroy
    @author.delete
    redirect_to :action => 'index'
    end

  def find_id
    @author=Author.find(params[:id])
  end

  private
  def author_params
    params.require(:author).permit(:last_name,:first_name,:dob,:email)
  end
end
