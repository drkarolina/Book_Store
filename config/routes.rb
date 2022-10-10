Rails.application.routes.draw do
  root "pages#index"
  resources :books, only: :index
end
