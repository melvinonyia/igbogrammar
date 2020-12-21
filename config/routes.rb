Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # RESTful (Representational state transfer)
  # DSL (domain specific language)

  # Basic format
  # method/HTTP verbs 'path/:wildcard', key: 'value(controller #action)'

  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  # Can all be created with:

  # resources :users, only: [:index, :show, :create, :update, :destroy, :new, :edit]

  # get 'classes/1/decks' nest collection routs
  #resources :classes do
  #  resources :decks, only: [:index] # collection route
  #end

  # Do not nest member routes
  #resources :decks, only: [:show, :create, :update, :destroy] # member routes



  # Specify the controller action that Rails
  # should run for GET /
  root to: 'static_pages#root'

end
