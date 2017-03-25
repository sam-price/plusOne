Rails.application.routes.draw do
  devise_for :users
  resources :users
  resource :dashboards

  authenticated :user do
    root to: "dashboards#index"
  end

  unauthenticated :user do
    root "landings#index"
  end

end
