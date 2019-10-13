Rails.application.routes.draw do
  root 'index#index'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :people
    end
  end

  match '*path', to: 'index#index', via: :all
end
