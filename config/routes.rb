Rails.application.routes.draw do
  resources :products, defaults: { format: :json } do
    resource :related_products, only: [:create, :destroy]
  end
end
