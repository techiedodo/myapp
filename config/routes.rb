Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  get 'services' => 'welcome#pricing'

  resources :subscribers, only: [:new, :create]

  resources :journals, only: [] do
    resources :entries
  end

  resources :boxes do
    resources :journals
    resources :pictures
    resources :recipients, only: [:create, :update, :destroy]
  end

  get :send_recipient_confirmation, to: 'recipients#send_recipient_confirmation', as: :send_recipient_confirmation
end
