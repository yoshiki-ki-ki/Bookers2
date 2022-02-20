class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to "/books"
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(book.id)
    else
      render :edit
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end