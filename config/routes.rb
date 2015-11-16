Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  get 'services' => 'welcome#pricing'

  resources :entries
  resources :boxes do
    resources :journals
  end
end
