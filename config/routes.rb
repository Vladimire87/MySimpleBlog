Rails.application.routes.draw do
  root 'posts#index'
  resources :posts

  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'

end
