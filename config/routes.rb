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

end
