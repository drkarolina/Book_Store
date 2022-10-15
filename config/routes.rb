Rails.application.routes.draw do
  devise_for :users
  root "pages#index"
  resources :books, only: %i[index show]
end
