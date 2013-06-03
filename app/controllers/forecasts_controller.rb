class ForecastsController < ApplicationController
  def new
    @error = false
    zip_code = params[:zip_code]
    forecast = Forecast.new
    @format_error = forecast.validate_zip(zip_code)
    if @format_error.nil?
      @location = forecast.get_city(zip_code)
      @error = true if @location == true
      @temp = forecast.get_temp(@location) if @error == false
    end
  end
end


