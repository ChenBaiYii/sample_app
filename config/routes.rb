Rails.application.routes.draw do


  get 'users/new'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get '/contact', to: 'static_pages#contact'
  # root 'application#hello'
  root 'static_pages#home'
  # user
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users # 允许资源被路由访问


  # get 'sessions/new' # sessions 不应该使用路由
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
