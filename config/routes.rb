Rails.application.routes.draw do
  resources :hospitals
  root 'welcome#index'

end
