Ems::Engine.routes.draw do
  root :to => "ems#index"
  
  # insight rules
  resources :categories do
    resources :articles, :news, :reports
  end  
  resources :articles, :news, :reports, :tags, :channels, :categories, :images, :media
end
