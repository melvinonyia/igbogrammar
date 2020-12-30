Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # RESTful (Representational state transfer)
  # DSL (domain specific language)

  namespace :api, defaults: {format: :json} do
    resource :course, only: [:index, :show, :create, :edit, :update, :destroy]
    resource :user, only: [:index, :new, :create, :show]
    resource :session, only: [:new, :create, :destroy]
  end

  # Specify the controller action that Rails
  # should run for GET /
  root to: 'static_pages#root'

end
