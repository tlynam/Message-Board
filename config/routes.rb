Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
  end

  root 'posts#index'

  resources :users, only: :show
end
