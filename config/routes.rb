Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  namespace :admin do
    resources :users
  end
  root to: 'trash_box#home'

  get '/about', to: 'trash_box#about'
  get '/help', to: 'trash_box#help'
  get '/contact', to: 'trash_box#contact'

  resources :records
end
