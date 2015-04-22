class Weathermanager

  def get_precipitation_chance(zipcode)
    query_string = build_query_string(zipcode)
    response = HTTParty.get(weather_api_url + "?" + query_string)

    #chance = parse_chance_from_response(response)
    
  end

  def build_query_string(zipcode)
    "q=#{zipcode}&format=json&num_of_days=1&date=today&tp=24%3D24&key=#{ENV["API_KEY"]}"
  end

   def parse_chance_from_response(response)
     answer = response['data']['weather']['hourly'][0]['chanceofrain'].to_i
    
# rescue Exception => e
#      logger.error(e.inspect)
#     logger.error(response['data']['weather']['hourly'])
   end

  def weather_api_url
    #when refactoring make into constant
    "http://api.worldweatheronline.com/free/v2/weather.ashx"
  end

  # to get #{ENV["API_KEY"] to work:
  # - bundle install
  # - create .env file in Heedtheherd directory
  # - type API_KEY = get secret key from nicole
  # - go to .gitignore and add .env

  #to make call to API Weathermanager.new.get_precipitation_chance(zipcode)
end