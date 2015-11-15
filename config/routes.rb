Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  get 'welcome/about'
  get 'welcome/pricing'
end
