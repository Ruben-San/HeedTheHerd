class Weathermanager
  def get_precipitation_chance(zipcode)
    query_string = build_query_string(zipcode)
    response = HTTParty.get(weather_api_url + "?" + query_string)
    chance = parse_chance_from_response(response)
    chance
  end

  def build_query_string(zipcode)
    "q=#{zipcode}&format=json&num_of_days=1&date=today&tp=24%3D24&key=#{ENV["API_KEY"]}"
  end

  def parse_chance_from_response(response)
    answer = response['data']['weather'].first['hourly'][0]['chanceofrain'].to_i
    

  end

  def weather_api_url
    "http://api.worldweatheronline.com/free/v2/weather.ashx"
  end

  # to get #{ENV["API_KEY"] to work:
  # - bundle install
  # - create .git file in Heedtheherd directory
  # - type API_KEY = get secret key from nicole
  # - go to .gitignore nad add .env

  #to make call to API Weathermanager.new.get_precipitation_chance(zipcode)
end