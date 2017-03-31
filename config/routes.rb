Rails.application.routes.draw do
  devise_for :users
  resources :users
  resource :dashboards
  resources :friendships, only: [:create, :destroy, :accept] do
    member do
      put :accept
    end
  end

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end



  authenticated :user do
    root to: "dashboards#index"
  end

  unauthenticated :user do
    root "landings#index"
  end

end
