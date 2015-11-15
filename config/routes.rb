Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  get 'services' => 'welcome#pricing'

  resources :boxes
end
