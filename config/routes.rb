Rails.application.routes.draw do
  get "albums/search"
  root to: "albums#search"
end
