Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
  devise_for :users
  resources :journals do
    resources :entries do
      member do
        post :decrypted
        get '/decrypted', to: redirect { |params| "/journals/#{params[:journal_id]}/entries/#{params[:id]}" }
      end
    end
    member do
      post :unlock
      get :locked
    end
  end
end
