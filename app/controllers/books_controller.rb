class BooksController < ApplicationController

  #教材でいう、post_books_controllerが、これ。

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new
    @newbook = Book.new
    @book.save
    redirect_to books_path(@book)
    @newbook.save
    redirect_to books_path(@book)
  end

  def index
    @books = Book.page(params[:page]).reverse_order
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
