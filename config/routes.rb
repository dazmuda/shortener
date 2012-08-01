Shortener::Application.routes.draw do
  resources :urls, :only => [:show, :new, :create, :destroy]
  root :to => redirect('/urls/new')
  # add this as a feature: match '/:vanity'
end
