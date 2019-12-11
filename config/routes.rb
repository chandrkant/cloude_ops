Rails.application.routes.draw do
  resources :pricings
  get '/service/AmazonCloudFront/region/:region' => 'pricings#price_data'
  require 'sidekiq'
  require 'sidekiq/web'
  require 'sidekiq-scheduler'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
