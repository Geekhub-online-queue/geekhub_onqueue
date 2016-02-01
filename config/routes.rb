Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'

  resources :hospitals do
    resources :doctors
  end
  root 'welcome#index'

end
