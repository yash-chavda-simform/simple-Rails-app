class BooksController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show; end
  
  def new
    @book = Book.new
    @author_options = Author.all.map{ |a| [a.first_name,a.id] }
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    end
  end

  def edit; 
    @author_options = Author.all.map{ |a| [ a.id ] }
  end

  def update
    if @book.update(book_params)
      redirect_to books_path
    end 
  end

  def destroy
    @book.delete
    redirect_to books_path
    end

  def find_id
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:name,:price,:author_id)
  end
end
