Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/climbing_gym',                  to: 'climbing_gym#index'
  get '/climbing_gym/new',              to: 'climbing_gym#new'
  post '/climbing_gym',                 to: 'climbing_gym#create'
  get '/climbing_gym/:id',              to: 'climbing_gym#show'
  get 'climbing_gym/:id/patrons',       to: 'climbing_gym_patrons#index'
  get 'climbing_gym/:id/patrons/new',   to: 'climbing_gym_patrons#new'
  post 'climbing_gym/:id/patrons',      to: 'climbing_gym_patrons#create'

  get '/patrons',                       to: 'patrons#index'
  get '/patrons/:id',                   to: 'patrons#show'
  get '/patrons/:id/edit',              to: 'patrons#edit'
  patch '/patrons/:id',                 to: 'patrons#update'

  get '/climbing_gym/:id/edit',          to: 'climbing_gym#edit'
  patch '/climbing_gym/:id',             to: 'climbing_gym#update'
  get '/climbing_gym/:id/patrons/alpha_index', to: 'climbing_gym_patrons#alpha_index'
  delete '/climbing_gym/:id',            to: 'climbing_gym#destroy'
end
