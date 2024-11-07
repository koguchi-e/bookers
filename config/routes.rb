Rails.application.routes.draw do
  # 新規作成ページへのルートを「books」に設定
  match "books" => "books#new", via: :get, as: "new_book"
  get "top" => "homes#top"

  # 新規投稿の処理（index アクションをポストに）
  post "books" => "books#index"

  # 詳細画面
  get "books/:id" => "books#show", as: "book"

  # 編集画面
  get "books/:id/edit" => "books#edit", as: "edit_book"
  patch "books/:id" => "books#update", as: "update_book"

  # 削除機能
  delete "books/:id" => "books#destroy", as: "destroy_book"
end
