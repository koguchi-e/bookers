Rails.application.routes.draw do
  # 新規作成
  root "homes#top"

  # resources（ルーティングの記述を短縮できる）
  # books コントローラの同じ名前のアクションに紐づく形で、以下のルーティングを自動生成してくれます。
  resources :books
end
