class UsersController < ApplicationController
  def index

  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
