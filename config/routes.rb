Rails.application.routes.draw do
  root 'groups#index'

  get '/groups/:id', to: 'groups#show'
  get '/groups/matches/:group_id/new/:players', to: 'matches#new'
  get 'matches/:group_id/new/:players', to: 'matches#new'

  post '/groups/matches/:group_id/new/:players', to: 'matches#create'
  post 'matches/:group_id/new/:players', to: 'matches#create'

end
