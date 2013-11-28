Urban::Application.routes.draw do
  devise_for :users
  scope :api do
    resources :users, except: [ :show, :new, :edit], defaults: { format: :json } do
      get ':id' => 'users#index', on: :collection
    
      resources :invoices, except: [ :show, :new, :edit ], defaults: { format: :json } do
        get ':id' => 'invoices#index', on: :collection

        resources :selections, except: [ :show, :new, :edit ], defaults: { format: :json } do
          get ':id' => 'selections#index', on: :collection
        end
      end
    end
  end

  root 'site#index'

end
