class BooksController < ApplicationController
  def new
    @book =Book.new
  end
  
  def show
    @bok= Book.new
    @book= Book.find(params[:id])
    @boook=Book.find(params[:id]).user
  end
  
  def index
   @bok = Book.new
   @books = Book.all
  end
  
  def create
   @bok = Book.new(book_params)
   @bok.user_id = current_user.id
   if @bok.save
     flash[:notice]="You have created book successfully."
     redirect_to book_path(@bok.id)
   else
     @books=Book.all
     render :index
   end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end 
  
  def edit
    book= Book.find(params[:id])
    unless book.user_id ==current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body , :image)
    
  end
  
end
