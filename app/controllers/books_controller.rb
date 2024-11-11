class BooksController < ApplicationController
  # 新規作成
  def new
    @books = Book.new
  end

  # 一覧画面表示
  def index
    # すべての本のデータを取得
    @books = Book.all
    @book = Book.new
  end

  # 新規作成
  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  # 詳細画面
  def show
    @book = Book.find(params[:id])
  end

  # 編集画面
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(@book.id)
    else
        flash.now[:alert] = "errors prohibited this book from being saved:"
        render :edit
    end
  end

  # 削除機能
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end