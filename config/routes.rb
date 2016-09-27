Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'user' => 'user#create'

  get 'user/:id' => 'user#show'
end
