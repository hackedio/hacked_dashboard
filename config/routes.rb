HackedDashboard::Application.routes.draw do
  resources :flickr_photos

  resources :tweets
  root :to => "home#index"
end

