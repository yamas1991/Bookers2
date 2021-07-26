class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
    @book.save
  end

  def create
   #@book = book.new
   # @book.user_id = current_user.id
    #@book.save
   #redirect_to book_path(@book)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end