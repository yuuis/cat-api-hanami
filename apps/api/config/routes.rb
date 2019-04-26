# frozen_string_literal: true

get '/cats', to: 'cats#index'
get '/cats/:id', to: 'cats#show'
post '/cats', to: 'cats#create'
