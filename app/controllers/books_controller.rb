class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(books_params)
    @book.save
    redirect_to(book_path(@book.id))
  end
  
  def new
  end

  def show
  end

  def edit
  end
  
private
  
  def books_params
  params.require(:book).permit(:title,:body)
  end
  
end
