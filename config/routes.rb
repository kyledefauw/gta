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

  resources :users

  resources :gardens do
    resources :crops
  end

  resources :crops do
    resources :plants
  end

  resources :plants do
    resources :plant_tasks
  end

  resources :plants do
    resources :plant_images
  end

  resources :plants do
    resources :stage_of_growths
  end

  resources :plant_tasks do
    resources :feedings
  end

  resources :plants do
    resources :general_notes
  end

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'
  get 'sign-out', to: 'sessions#destroy'

end
