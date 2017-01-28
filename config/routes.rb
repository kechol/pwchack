Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'routes#search'
  get  'routes/map/:uuid', to: 'routes#map', as: 'routes_map'
  post 'routes/create',    to: 'routes#create'
  get  'messages', to: 'messages#index', format: :json
end
