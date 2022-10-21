Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "pages#index"
  resources :books, only: %i[index show]
  resources :settings, only: %i[index]
end
