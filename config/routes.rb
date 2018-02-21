Rails.application.routes.draw do
  root "search#index"

  resources :search, only: [:index] do
    collection { get :results }
  end
end
