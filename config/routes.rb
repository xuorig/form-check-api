Rails.application.routes.draw do
  devise_for :users
  namespace :v1 do
    resources :graphql, controller: :graphql
  end
end
