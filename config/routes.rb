# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'
      post 'auth/login', to: 'authentication#login'
    end
  end
end
