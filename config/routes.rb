Rails.application.routes.draw do
  # locations routes
  resources :locations, only: [:index, :show]
  
  # denunciations routes
  get 'denunciations', to: 'denunciations#index'
  post 'denunciations', to: 'denunciations#create'
   
  # reports routes
  get 'reports/abducted_survivors'
  get 'reports/non_abducted_survivors'
  get 'reports/abducted_percentage'

  # survivors routes
  resources :survivors, only: [:index, :show, :create, :update] # destroy route is not used.
end
