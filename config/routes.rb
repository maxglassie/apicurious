Rails.application.routes.draw do
  get '/commits/:id', to: 'commit#index', as: 'commit'
  get '/profile/:id', to: 'profile#show', as: 'profile'
  get '/dashboard', to: 'dashboard#show'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'home#show'
end
