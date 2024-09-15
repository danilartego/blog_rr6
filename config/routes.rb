Rails.application.routes.draw do
  get '/', to: "home#index"

  resource :contacts, only: [:new, :create]
  resources :articles
end
