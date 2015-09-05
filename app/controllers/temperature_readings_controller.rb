class TemperatureReadingsController < ApplicationController
  def index
    @pres = TemperaturePresenter.new(TemperatureReading)
  end

  def create
    TemperatureReading.create(temperature: params[:temperature])
    render nothing: true
  end
end
