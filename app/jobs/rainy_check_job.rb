class RainyCheckJob < ActiveJob::Base
  queue_as :default

  def perform(zipcode)
      users.zipcodes.each do |z|
        rain = weathermanger.new('z').get_percipitation_chance
        if rain > 40
          UserMailer.weather_email(@user).deliver_later
        end  
      end
  end

#get user zipcodes
#call method to get api weather
#go through response and get chance or rain
#if rain chance greater than 40%
#send weather eamil
end
