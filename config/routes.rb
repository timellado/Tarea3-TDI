Rails.application.routes.draw do
  get 'app/film'

  get 'app/person'

  get 'app/starship'

  get 'app/planet'

  root 'app#index'

  post 'app/search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
