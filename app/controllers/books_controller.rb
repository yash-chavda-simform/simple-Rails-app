class BooksController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @books=Book.all
  end

  def show; end
  
  def new
    @book=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to :action => 'index'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to :action => 'index'
    end 
  end

  def destroy
    @book.delete
    redirect_to :action => 'index'
    end

  def find_id
    @book=Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:name,:price)
  end
end
