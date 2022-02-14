class BooksController < ApplicationController
  protect_from_forgery

  def index
    @Book = Book.new
    @books = Book.all
  end

  def create
    @Book = Book.new(book_params)
  if @Book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@Book.id)
  else
    @books = Book.all
    render :index
  end

  end

  def show
    @book = Book.find(params[:id])
   
    
  end

  def edit
    @book = Book.find(params[:id])
   
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
   else
     render :edit
   end   
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroy."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
