Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :finds
    collection do
      get 'search'
    end
    get 'items/search',  to: 'items#search'
  end
end
