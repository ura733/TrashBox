Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  namespace :admin do
    resources :users
  end

  resources :users, only: [:show, :create, :new]

  root to: 'trash_box#home'

  get '/about', to: 'trash_box#about'
  get '/help', to: 'trash_box#help'
  get '/contact', to: 'trash_box#contact'

  resources :records
end
