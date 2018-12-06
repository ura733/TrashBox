Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root to: 'trash_box#home'

  get '/about', to: 'trash_box#about'
  get '/help', to: 'trash_box#help'
  get '/contact', to: 'trash_box#contact'

  resources :records
end
