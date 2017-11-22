Rails.application.routes.draw do
  resources :reviews
  resources :restaurants do
    member do
      get 'review', to: "restaurant#review"
    end
    resources :reviews, only: [ :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#   Prefix          Verb   URI Pattern                                       Controller#Action
#  reviews          GET    /reviews(.:format)                                reviews#index
#                   POST   /reviews(.:format)                                reviews#create
# new_review        GET    /reviews/new(.:format)                            reviews#new
# edit_review       GET    /reviews/:id/edit(.:format)                       reviews#edit
#   review          GET    /reviews/:id(.:format)                            reviews#show
#                   PATCH  /reviews/:id(.:format)                            reviews#update
#                   PUT    /reviews/:id(.:format)                            reviews#update
#                   DELETE /reviews/:id(.:format)                            reviews#destroy
# review_restaurant GET    /restaurants/:id/review(.:format)                 restaurant#review
# restaurant_reviews      POST   /restaurants/:restaurant_id/reviews(.:format)     reviews#create
# new_restaurant_review   GET    /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
# restaurants             GET    /restaurants(.:format)                            restaurants#index
#                         POST   /restaurants(.:format)                            restaurants#create
# new_restaurant          GET    /restaurants/new(.:format)                        restaurants#new
# edit_restaurant         GET    /restaurants/:id/edit(.:format)                   restaurants#edit
# restaurant              GET    /restaurants/:id(.:format)                        restaurants#show
#                         PATCH  /restaurants/:id(.:format)                        restaurants#update
#                         PUT    /restaurants/:id(.:format)                        restaurants#update
#                         DELETE /restaurants/:id(.:format)                        restaurants#destroy

end
