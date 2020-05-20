Rails.application.routes.draw do
  resources :invoices
  resources :bills
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/customers/:id' => 'customers#update'
  get '/customers/:id/destroy' => 'customers#destroy'

  get '/invoices/:id/:customer_id/new' => 'invoices#new'
  get '/invoices/create' => 'invoices#create'
  # get '/invoices/:id/:customer_id/new/:bill_no/:cus_id/:name/:amount/:date' => 'invoices#create'
  # post '/invoices' => 'invoices#create'
  root "bills#index"
end
