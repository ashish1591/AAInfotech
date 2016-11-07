Rails.application.routes.draw do
  devise_for :models
  resources :complaints
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/get_all_systems/:id", :to => "complaints#get_all_systems", as: :get_all_systems
  get '/feed', :to => 'profiles#feed', as: 'feed'
  post "/create_update_problem/:pid/:cid", :to => "complaints#create_update_problem", as: :create_update_problem
  
  post "/get_problem_partial/:cid/:pid", :to => "complaints#get_problem_partial", as: :get_problem_partial


end
