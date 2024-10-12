Rails.application.routes.draw do
  get '/', to: "home#index"
  get 'about', to: "home#about"
  get 'terms', to: "home#terms"

  resource :contacts, only: [:new, :create], path_names: { new: '' }
  resources :articles
end
