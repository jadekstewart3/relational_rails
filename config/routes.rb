Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/climbing_gym',                  to: 'climbing_gym#index'
  get '/climbing_gym/:id',              to: 'climbing_gym#show'
  get '/patrons',                       to: 'patrons#index'
  get '/patrons/:id',                   to: 'patrons#show'
  get 'climbing_gym/:gym_id/patrons',   to: 'climbing_gym_patrons#index'
end
