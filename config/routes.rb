Rails.application.routes.draw do
  root "search#index"

  resources :songs do
    collection do
      get :search
    end
  end
end
