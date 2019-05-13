Rails.application.routes.draw do
  get '/games/new', to: 'games#new'
  post '/games/score', to: 'games#score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# get  "/contact", to: "pages#contact"

# Open you routes.rb file and tweak the routes automatically generated by the previous command.
# In the end, rails routes should return something like this:

# Prefix Verb URI Pattern      Controller#Action
#    new GET  /new(.:format)   games#new
#  score POST /score(.:format) games#score
