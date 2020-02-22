Rails.application.routes.draw do
  root to: 'home#index'

  apipie

  namespace :api, defaults: { format: :json } do
    get 'accounts/balance'
    post 'accounts/transfer'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
