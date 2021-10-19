namespace :settings do
  get :profile, to: 'profiles#show'
  patch :profile, to: 'profiles#show'
  delete :pofile, to: 'profiles#destroy'
end
