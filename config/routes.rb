Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :users do
    resources :events do
      resources :tags
    end
  end
  resources :tags do
    resources :events
  end
end
