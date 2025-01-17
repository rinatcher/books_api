Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :reading_statuses, only: [:index, :show, :create, :update, :destroy]
  resources :comments, only: [:index, :show, :create, :update, :destroy]
  resources :reviews, only: [:index, :create, :update, :destroy] do
    collection do
      get ':isbn', to: 'reviews#show_by_isbn', as: 'show_by_isbn'
    end
  end
end
