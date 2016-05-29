Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  scope module: :web do
    get    'sign_up'  => 'users#new'
    post   'sign_up'  => 'users#create'
    get    'profile'  => 'users#show'

    get    'sign_in'  => 'sessions#new'
    post   'sign_in'  => 'sessions#create'
    delete 'sign_out' => 'sessions#destroy'

    resources :users, slallow: true do
      resources :boards do
        resources :lists do
          resources :cards
        end
      end
    end
  end
end
