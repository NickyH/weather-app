WeatherTrack::Application.routes.draw do
  root :to => 'home#index'
  resources :forecasts, :only => [:new]
end

