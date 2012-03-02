Ems::Engine.routes.draw do
  get "ems/index"

  root :to => "ems#index"
end
