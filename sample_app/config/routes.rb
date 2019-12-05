Rails.application.routes.draw do

  root 'static_pages#home'

  get  "/help" => "static_pages#help" #この書き方でも問題ない！

  get  '/about',   to: 'static_pages#about'

  get  '/contact', to: 'static_pages#contact'

  get '/signup' => 'users#new'

  post '/signup' => 'users#create'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
