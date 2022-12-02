Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "curiae#index"

  resources :curiae

  resources :praesidia

  resources :members do
    get 'birthday', :on => :collection
  end
end
