Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  get 'services' => 'welcome#pricing'

  resources :journals, only: [] do
    resources :entries
  end

  resources :boxes do
    resources :journals
    resources :recipients, only: [:create, :update, :destroy]
  end
end
