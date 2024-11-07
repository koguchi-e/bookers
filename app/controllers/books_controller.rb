class BooksController < ApplicationController
  # 新規作成 
  def new
    @book = Book.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save
    redirect_to book_path(book.id)
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
    book = Book.find(params[:id])
    book.update(book.params)
    redirect_to book_path(book.id)
  end

  # 削除機能
  def destroy
    book = book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
