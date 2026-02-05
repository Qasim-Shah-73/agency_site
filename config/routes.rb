Rails.application.routes.draw do
  get "home",      to: "pages#home",      as: :home
  get "about",     to: "pages#about",     as: :about
  get "services",  to: "pages#services",  as: :services
  get "portfolio", to: "pages#portfolio", as: :portfolio
  get "contact",   to: "pages#contact",   as: :contact
  get "thank-you", to: "pages#thank_you", as: :thank_you
  post "contact",  to: "contacts#create"

  root "pages#home"
end
