MySalary::Application.routes.draw do
  root to: 'home#index'
  get "home/index"

  namespace :api do
    resources :tasks
  end

  match '/tasks' => 'home#index', via: [:get, :post]
  match '/tasks/*page' => 'home#index', via: [:get, :post]
  
end
