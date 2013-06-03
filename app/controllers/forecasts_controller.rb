class ForecastsController < ApplicationController
  def new
    @error = false
    zip_code = params[:zip_code]
    forecast = Forecast.new
    @format_error = forecast.validate_zip(zip_code)
    if @format_error.nil?
      begin
        @location = forecast.get_city(zip_code)
      rescue
        flash[:notice] = "No connection. Try again."
        return
      end
      @error = true if @location == true
      begin
        @temp = forecast.get_temp(@location) if @error == false
      rescue
        flash[:notice] = "No connection. Try again."
        return
      end
    end
  end
end
