Instaconcert::Application.routes.draw do
  get "images/index"

  resources :events
  resources :event_requests

	get "/eventgroups" => 'eventgroups#index'
	get "/eventgroups/:id" => 'eventgroups#show'
	
  root :to => 'images#index'
  
  get "/eventsindex" => 'events#eventsindex'
end
