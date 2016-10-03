Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user' => 'users#show'

  post 'user' => 'users#create'

  get 'match' => 'matching#get_match'

  get 'conversations' => 'conversations#get'

  get 'conversations/:id/messages' => 'conversations#get_messages'

  # resources :conversations do
  #   resources :messages
  # end
end
