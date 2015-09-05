class TemperatureHandler
  MIN_TEMP = 66
  MAX_TEMP = 72

  def temperature_created(model)
    temp = model.temperature
    SMSNotifier.new.notify(temp) if temp < MIN_TEMP || temp > MAX_TEMP
  end

end
