require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'

  devise_for :users

  resources :journals do
    resources :reminders
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

  get '/service-worker.js', to: 'service_worker#service_worker'
  get '/manifest.json', to: 'service_worker#manifest'

  mount Ckeditor::Engine => '/ckeditor'

  authenticated :user, ->(user) { user.handle == 'evan' } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
