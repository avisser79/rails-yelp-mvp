Rails.application.routes.draw do
  root to: "restaurants#index"
  # get 'model/Restaurant'

  # get 'model/name:string'

  # get 'model/address:string'

  # get 'model/phone_number:integer'

  # get 'model/category:string'
  # resources :restaurants
  # resources :reviews
  resources :restaurants, only: [ :index, :new, :create, :show ] do
    resources :reviews, only: [ :index, :new, :create ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
