Rails.application.routes.draw do
  get 'users/show'

  resources :users do
    collection do
      resource :registrations, only: [:show, :new, :create]
      resource :sessions, only: [:new, :create, :destroy]
    end
  end
end
