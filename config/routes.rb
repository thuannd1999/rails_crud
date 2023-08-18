BEGIN {
   puts "Initializing Ruby Program"
}

Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :brands, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  resources :restaurants do
    resources :dishes
  end
end