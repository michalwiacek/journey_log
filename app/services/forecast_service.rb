# frozen_string_literal: true

class ForecastService < BaseService
  require 'forecast_io'
  attr_accessor :location, :date

  def initialize(location, date)
    self.location = location
    self.date = date
  end

  def call
    geocoder = search_for_location
    fetch_forecast(geocoder)
  end

  private

  def search_for_location
    Geocoder.search(location)
  end

  def fetch_forecast(geocoder)
    if geocoder.blank?
      Rails.logger.debug "Filed finding location: #{location}"
    else
      ForecastIO.forecast(geocoder.first.latitude,
                          geocoder.first.longitude,
                          time: date.to_time.to_i,
                          params: { units: 'si' }).dig(:daily,
                                                       :data,
                                                       0).slice('summary',
                                                                'humidity',
                                                                'temperatureMax',
                                                                'temperatureMin')
    end
  end
end
