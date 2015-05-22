Rails.application.routes.draw do

  root 'static_pages#index'

  resources :gardens do
    resources :crops
  end

  resources :crops do
    resources :plants
  end

  resources :plants do
    resources :plant_tasks
  end

  resources :plant_tasks do
    resources :stage_of_growths
  end

  resources :plant_tasks do
    resources :feedings
  end

  resources :plant_tasks do
    resources :general_notes
  end

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'
  get 'sign-out', to: 'sessions#destroy'

end
