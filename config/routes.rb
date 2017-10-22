Rails.application.routes.draw do
  get 'groups/index'
  get '/groups/:id', to: 'groups#index'

  root 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
