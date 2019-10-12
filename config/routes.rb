Rails.application.routes.draw do
  get '/', to: 'index#index'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :people
    end
  end
end
