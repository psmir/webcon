Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get :dashboard, to: "dashboard#show"

  resource :session
  resource :users, only: %i[new create]
  
  root to: "landing#index"
end
