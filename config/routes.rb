# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'
      post 'login', to: 'authentication#login'
      post 'signup', to: 'users#create'

      resources :users, only: :show

      resource :user, only: [] do
        get :profile, on: :member
      end
    end
  end
end
