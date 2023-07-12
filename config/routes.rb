require 'karafka/web'
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount Karafka::Web::App, at: '/karafka'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
