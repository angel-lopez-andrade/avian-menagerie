Rails.application.routes.draw do
  # Homepage
  get "/", to: "pages#home", as: "root"

  # Pages
  get "/welcome", to: "pages#home", as: "welcome"
  get "/about", to: "pages#about", as: "about"

  # Breeds
  get "/breeds", to: "breeds#index", as: "breeds"
  get "/breeds/new", to: "breeds#new", as: "new_breed"
  post "/breeds", to: "breeds#create"
  get "/breeds/:breed_id/forum", to: "breeds#forum", as: "breed_forum" #or forums#index layout? - ...#forum acceptable as ...#home is?

  # Birds
  #acceptable to have /breeds routes calling birds controller?
  get "/breeds/:breed_id/birds", to: "birds#index", as: "birds"
  get "/birds/new", to: "birds#new", as: "new_bird"
  post "/breeds/:breed_id/birds", to: "birds#create"
  get "/breeds/:breed_id/birds/:bird_id", to: "birds#show", as: "bird"
  get "/breeds/:breed_id/birds/:bird_id/edit", to: "birds#edit", as: "edit_bird"
  patch "breeds/:breed_id/birds", to: "birds#update"
  #chuck in a delete confirmation via the view
  delete "/breeds/:breed_id/birds", to: "birds#destroy"

  # Snacks
  get "/snacks", to: "snacks#index", as: "snacks"
  get "/snacks/:id", to: "snacks#show", as: "snack"

  # Cages
  get "/cages", to: "cages#index", as: "cages"
  get "/cages/:id", to: "cages#show", as: "cage"
end
