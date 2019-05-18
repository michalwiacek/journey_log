# frozen_string_literal: true

class WeathersController < ApplicationController
  def index
    @weather = Weather.new
  end

  def create
    respond_to do |format|
      @forecast = ["forecast"]
      location = params[:weather][:location]
      year = params[:weather]['date(1i)'].to_i
      month = params[:weather]['date(2i)'].to_i
      day = params[:weather]['date(3i)'].to_i
      @forecast = ForecastService.call(location, Date.civil(year, month, day))
      format.js
    end
  end

  private

  def weather_params
    params.require(:trip).permit(:location, :date)
  end
end
