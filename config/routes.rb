Rails.application.routes.draw do
  # Devise - Check default Devise routes with 'rails routes' (terminal) and default Devise views at app/views/devise
  devise_for :users

  # Homepage
  get "/", to: "pages#home", as: "root"

  # Pages
  get "/welcome", to: "pages#home", as: "welcome"
  get "/about", to: "pages#about", as: "about"

  # Breeds
  get "/breeds", to: "breeds#index", as: "breeds"
  get "/breeds/new", to: "breeds#new", as: "new_breed"
  post "/breeds", to: "breeds#create"

  # Forums
  get "/breeds/:breed_id/forum", to: "forums#show", as: "forum"
  get "/breeds/:breed_id/forum/new", to: "forums#new", as: "new_post"
  post "/breeds/:breed_id/forum", to: "forums#create"

  # Birds
  get "/birds/new", to: "birds#new", as: "new_bird"
  get "/breeds/:breed_id/birds", to: "birds#index", as: "birds"
  post "/breeds/birds", to: "birds#create"
  get "/breeds/:breed_id/birds/:bird_id", to: "birds#show", as: "bird"
  get "/breeds/:breed_id/birds/:bird_id/edit", to: "birds#edit", as: "edit_bird"
  patch "breeds/birds", to: "birds#update"
  delete "/breeds/:breed_id/birds", to: "birds#destroy"

  # Snacks
  get "/snacks", to: "snacks#index", as: "snacks"
  get "/snacks/:id", to: "snacks#show", as: "snack"

  # Cages
  get "/cages", to: "cages#index", as: "cages"
  get "/cages/:id", to: "cages#show", as: "cage"

  # Ultrahook
  post "/payments/webhook", to: "payments#webhook"
end
