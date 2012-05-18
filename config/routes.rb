Ems::Engine.routes.draw do
  root :to => "ems#index"
  
  resources :articles, :news, :reports# , :only => [:update, :create, :destroy]
  # insight rules
  resources :categories do
    resources :articles, :news, :reports# , :only => [:index, :new, :show, :edit]
  end  
  resources :tags, :channels, :categories, :images, :media
end
