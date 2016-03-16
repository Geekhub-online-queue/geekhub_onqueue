Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile', as: 'user_root'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'

  resources :hospitals do
    resources :doctors do
      resources :records
    end
  end
  root 'welcome#index'
  get 'specializations/(:id)', to: 'hospital#show', as: :specializations
end
