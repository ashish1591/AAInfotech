Rails.application.routes.draw do
  resources :complaints
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/get_all_systems/:id", :to => "complaints#get_all_systems", as: :get_all_systems
  get '/feed', :to => 'profiles#feed', as: 'feed'

end
