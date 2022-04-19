Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root "items#index"
  resources :items do
    resources :finds
    collection do
      get 'search'
    end
  end
  get 'items/marker',  to: 'items#marker',  as: :marker
end
