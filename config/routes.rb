Ems::Engine.routes.draw do
  root :to => "ems#index"
  
  resources :articles, :news, :reports
  # insight rules
  resources :categories, :only => [:index, :show] do
    resources :articles, :news, :reports
  end  
  resources :tags, :channels, :images, :media
end
