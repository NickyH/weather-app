class ForecastsController < ApplicationController
  def new
    @error = false
    zip_code = params[:zip_code]
    if zip_code.length != 5 || !zip_code.match(/^\S*[A-z]+$/).nil?
      @format_error = true
    else
      forecast = Forecast.new
      @location = forecast.get_city(zip_code)
      @error = true if @location == true
      @temp = forecast.get_temp(@location) if @error == false
    end
  end
end


