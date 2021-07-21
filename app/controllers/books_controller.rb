class BooksController < ApplicationController

  def index
    puts "作成したキー #{ENV['SECRET_KEY']}"
    @book = Book.new
    @books = Book.all.order(id: :asc)
  end

  def create
    @books =Book.all
    @book = Book.new(books_params)
    if @book.save
      redirect_to(book_path(@book.id))
    else
      render :index
    end
    flash[:notice] = "Book was successfully created."
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
    
    if @book.update(books_params)
      
       redirect_to(book_path(@book.id))
       flash[:notice] = "Book was successfully updated."
    else
       render :edit
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to(books_path)
    flash[:notice] = "Book was successfully destroyed."
  end

private

  def books_params
  params.require(:book).permit(:title,:body)
  end

end
