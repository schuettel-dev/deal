Rails.application.routes.draw do
  root to: 'landing_pages#show'

  scope '/:locale' do
    devise_for :users
    draw(:settings)
  end
end
