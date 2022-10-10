Rails.application.routes.draw do
  root "pages#index"
  resources :books, only: %i[index show]
end
