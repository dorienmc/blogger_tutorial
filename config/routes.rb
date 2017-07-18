Blogger::Application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :comments #added in a loop because its a sub-resource
  end
  resources :tags
  resources :authors

  resources :author_sessions, only: [:new, :create, :destroy]
  get 'login' => 'author_sessions#new' #rename link to 'login'
  get 'logout' => 'author_sessions#destroy'
end
