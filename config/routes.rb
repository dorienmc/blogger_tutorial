Blogger::Application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :comments #added in a loop because its a sub-resource
  end
  resources :tags
end
