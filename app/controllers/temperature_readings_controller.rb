class TemperatureReadingsController < ApplicationController
  def index
    @last_temp = TemperatureReading.last
    @temperatures = TemperatureReading.last(25)
  end

  def create
    TemperatureReading.create(temperature: params[:temperature])
    render nothing: true
  end
end
