class TemperatureReadingsController < ApplicationController
  def index
    @pres = TemperaturePresenter.new(TemperatureReading)
  end

  def create
    TemperatureReading.create(temperature: params[:temperature_reading][:temperature])
    render json: { status: 200 }
  end

  private

  def temperature_params
    params.require(:temperature_reading).permit(:temperature)
  end
end
