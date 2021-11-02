Rails.application.routes.draw do
  root to: 'landing_pages#show'

  devise_for :users
  draw(:settings)
end
