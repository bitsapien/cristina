Rails.application.routes.draw do
  resources :conversations
  resources :my_tasks
  resources :friends
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
