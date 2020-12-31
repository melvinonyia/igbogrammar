Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # RESTful (Representational state transfer)
  # DSL (domain specific language)

  namespace :api, defaults: {format: :json} do

    # Session routes
    resource :session, only: [:new, :create, :destroy]

    # User routes
    resources :users, only: [:index, :new, :create, :show]

    # Course routes
    resources :courses, only: [:index, :show, :create, :edit, :update, :destroy] do
      resources :decks, only: [:new]
    end

    # Deck routes
    resources :decks, only: [:index, :show, :create, :edit, :update, :destroy] do
      resources :cards, only: [:new]
    end

    # Card routes
    resources :cards, only: [:index, :show, :create, :edit, :update, :destroy]

  end

  # Specify the controller action that Rails
  # should run for GET /
  root to: 'static_pages#root'

end
