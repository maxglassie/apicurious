Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#show'
  get '/auth/github/callback', to: 'sessions#create'
  root 'home#show'
end
