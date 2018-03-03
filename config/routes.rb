Rails.application.routes.draw do
  devise_for :users
  get '/' => "smart_hire#index", as: "main"
  post '/' => "smart_hire#index", as: "main_post"
  root 'smart_hire#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
