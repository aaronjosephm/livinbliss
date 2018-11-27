Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#show'

  post '/', to: 'landing#create'

  get '/about', to: 'about#show'

  get '/health', to: 'health#show'

  get '/yoga', to: 'yoga#show'

  get '/doula', to: 'doula#show'

  get '/resources', to: 'resources#show'

  post '/connect', to: 'connect#create'

  get '/connect', to: 'connect#show'

end
