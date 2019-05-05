Rails.application.routes.draw do
  post 'denunciations', to: 'denunciations#create'
  
  get 'reports/abducted_survivors'
  get 'reports/non_abducted_survivors'
  get 'reports/abducted_percentage'

  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
