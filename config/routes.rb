Rails.application.routes.draw do
  resources :temperature_readings
  root to: 'temperature_readings#index'
end
