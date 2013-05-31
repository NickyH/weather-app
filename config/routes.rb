WeatherTrack::Application.routes.draw do
  root :to => 'home#index'
  resources :forecast, :only => [:new]
end

