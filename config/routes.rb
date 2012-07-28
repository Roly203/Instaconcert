Instaconcert::Application.routes.draw do
  resources :events
  resources :event_requests
  root :to => 'events#index'
end
