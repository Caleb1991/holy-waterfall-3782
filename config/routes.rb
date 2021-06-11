Rails.application.routes.draw do
  get '/airlines/:id', to: 'airlines#show'

  get '/flights', to: 'flights#index'

  delete '/passenger_flights/:id/destroy', to: 'passenger_flights#destroy'
end
