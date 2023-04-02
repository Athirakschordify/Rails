class RestaurantsController < ApplicationController
 def index
    uri = URI('http://127.0.0.1:3000/api/v1/restaurantmanagements') # Replace with the URL of your API app
    response = Net::HTTP.get(uri)
    @data = JSON.parse(response)
 end
end
