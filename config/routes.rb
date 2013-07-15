HackedDashboard::Application.routes.draw do
  resources :notifications

  resources :stats

  resources :youtube_videos

  resources :new_items

  resources :flickr_photos

  resources :tweets
  root :to => "home#index"
end

