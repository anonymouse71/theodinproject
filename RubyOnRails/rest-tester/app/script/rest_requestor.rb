require 'rest-client'
#url = "http://localhost:3000"
#url = "http://localhost:3000/users"
#url = "http://localhost:3000/users/new"
url = "http://localhost:3000/users/edit"
#url = "http://localhost:3000/users/show"

puts RestClient.get url

