Instaconcert::Application.routes.draw do

  resources :events
  resources :event_requests

	get "/eventgroups" => 'eventgroups#index'
	get "/eventgroups/:id" => 'eventgroups#show'
	
  root :to => 'events#index'
end
