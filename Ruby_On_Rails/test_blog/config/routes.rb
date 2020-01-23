Rails.application.routes.draw do
  resources :posts do
	resources :comments
  end

  get 'home/index'
 
  root 'home#index'
end