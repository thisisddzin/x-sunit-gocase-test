Rails.application.routes.draw do
  get 'denunciations', to: 'denunciations#index'
  post 'denunciations', to: 'denunciations#create'
  
  get 'reports/abducted_survivors'
  get 'reports/non_abducted_survivors'
  get 'reports/abducted_percentage'

  resources :survivors, only: [:index, :show, :create, :update] # destroy route is not used.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
