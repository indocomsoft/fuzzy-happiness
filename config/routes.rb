Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :supervisors
  resources :duties do
    collection do
      get 'dropped'
    end
  end
  resources :problems 
end
