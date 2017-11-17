Rails.application.routes.draw do
  resources :scores
  resources :employees
  resources :organizations do
    member do
      get 'refresh'
      get 'shiftscore'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
