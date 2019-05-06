Rails.application.routes.draw do
   
  # Reports routes.
  get 'reports/abducted_survivors'
  get 'reports/non_abducted_survivors'
  get 'reports/abducted_percentage'

  #############
  # RESOURCES #
  #############

  # Locations routes.
  resources :locations, only: [:index, :show] do 
  end
  
  # Denunciations routes.
  resources :denunciations, only: [:index, :create] do
    resource :survivor
  end

  # Survivors routes (destroy route is not used).
  resources :survivors, only: [:index, :show, :create, :update] do
    resource :location, only: [:index, :show]
  end
end
