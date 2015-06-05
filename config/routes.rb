Rails.application.routes.draw do

  root 'static_pages#index'
  get '/tips', to: 'tips#index'
  get '/bloom_state', to: 'tips#bloom_state'
  get '/cloning', to: 'tips#cloning'
  get '/curing', to: 'tips#curing'
  get '/environment', to: 'tips#environment'
  get '/pruning', to: 'tips#pruning'
  get '/topping', to: 'tips#topping'
  get '/veg_state', to: 'tips#veg_state'
  get '/soil', to: 'tips#soil'
  get '/hydroponics', to: 'tips#hydroponics'
  get '/co2enrichment', to: 'tips#co2enrichment'
  get '/training', to: 'tips#training'

  resources :users

  resources :gardens do
    resources :crops
    resources :caretakers
  end

  resources :crops do
    resources :plants
  end

  resources :plants do
    resources :plant_entries
  end

  resources :plant do
    resources :general_notes
  end

  resources :plant do
    resources :sprayings
  end

  resources :plant do
    resources :plant_images
  end

  resources :plant do
    resources :stage_of_growths
  end

  resources :plant do
    resources :plant_tasks
  end

  resources :plant do
    resources :feedings
  end



  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'
  get 'sign-out', to: 'sessions#destroy'

end
