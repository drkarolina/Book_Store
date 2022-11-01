Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/user_data', omniauth_callbacks: 'users/omniauth_callbacks' }
  root "pages#index"
  resources :books, only: %i[index show]
  resources :settings, only: %i[index]
  resources :addresses, only: %i[create]
  resources :reviews, only: %i[create]
end
