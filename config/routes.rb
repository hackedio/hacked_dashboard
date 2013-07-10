HackedDashboard::Application.routes.draw do
  resources :new_items

  resources :flickr_photos

  resources :tweets
  root :to => "home#index"
end

