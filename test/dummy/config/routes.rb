Rails.application.routes.draw do
  devise_for :users, :class_name => "User"
  mount Ems::Engine => "/ems"
end
