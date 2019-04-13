# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :dashboard, to: 'dashboard#show'
  get :consultant_panel, to: 'consultant_panel#show'

  resource :session
  resource :users, only: %i[new create]

  root to: 'landing#index'
end
