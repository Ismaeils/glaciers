Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :inboxes, param: :token do
    resources :conversations, param: :number do
      resources :messages, param: :number do
        collection do
          get 'search/:term', to: 'search#search'
        end
      end
    end
  end
end
