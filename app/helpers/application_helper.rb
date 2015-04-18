require HTTParty

module ApplicationHelper
  

  #def parameters
    #User.each do |user|
     # q = user.zipcode
      #num_of_days = 1
      #tp = 24
    
  end

  response= get(api.worldweatheronline.com/free/v2/weather.ashx?q=23192&format=json&num_of_days=1&date=today&tp=tp%3D24&key=31f6ddb631ced9c600aad9ab924d7)
  puts response.body
end
