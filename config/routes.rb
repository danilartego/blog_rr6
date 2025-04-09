Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  # get '/', to: "home#index"
  get 'about', to: "home#about"
  get 'terms', to: "home#terms"

  resource :contacts, only: [:new, :create], path_names: { new: '' }
  resources :articles do 
    resources :comments, only: [:create]
  end
end
