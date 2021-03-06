class RainyCheckJob < ActiveJob::Base
  # require 'Weathermanager'

 include Delayed::RecurringJob
  run_every 1.day
  run_at '11:00am'
  timezone 'US/Pacific'
  queue 'rainy-jobs'

  def perform
    users = User.all
      users.each do |user|
        weather = Weathermanager.new.get_precipitation_chance(user.zipcode)
                # rain = weather.get_precipitation_chance(user.zipcode)
        
        answer = weather['data']['weather'].first['hourly'][0]['chanceofrain'].to_i
        if answer > 40
          UserMailer.weather_email(user).deliver_later
        end  
      end
  end
#get user zipcodes
#call method to get api weather
#go through response and get chance or rain
#if rain chance greater than 40%
#send weather eamil
end