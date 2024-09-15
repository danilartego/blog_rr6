Rails.application.routes.draw do
  get '/', to: "home#index"

  resource :contacts, only: [:new, :create], path_names: { new: '' }
  resources :articles
end
