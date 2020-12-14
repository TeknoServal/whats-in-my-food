Rails.application.routes.draw do
  root "welcome#index"

  get '/foods', to: "foods#show", as: :foods
end
