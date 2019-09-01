Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
  devise_for :users
  resources :journals do
    resources :entries
    member do
      post :unlock
      get :locked
    end
  end
end
