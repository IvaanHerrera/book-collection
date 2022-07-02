Rails.application.routes.draw do
  resources :books
  delete 'books', to: 'books#index'
end
