class Forecast

  def get_city(zip_code)
    zip_error = false
    open("http://api.wunderground.com/api/#{ENV['WDG_KEY']}/geolookup/q/#{zip_code}.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      zip_error = true if parsed_json['response']['error'] != nil
      if zip_error == false
        city = parsed_json['location']['city']
        state = parsed_json['location']['state']
        return state, city
      else
        return zip_error
      end
    end
  end

  def get_temp(location)
    state = location[0]
    city = location[1].gsub(' ', '_')
    open("http://api.wunderground.com/api/ed044d75b91fb500/conditions/q/#{state}/#{city}.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      temp_f = parsed_json['current_observation']['temp_f']
    end
  end

  def validate_zip(zip_code)
    @format_error = true if !zip_code.match(/^\d{5}$/)
  end

end
