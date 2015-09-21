class TemperaturePresenter
  MINUTE_DIVISOR = 15

  def initialize(klass)
    @klass = klass
  end

  def current_temperature
    last_reading.temperature
  end

  def last_reading
    @klass.last
  end

  def formatted_time(temp)
    temp.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%l:%M")
  end

  def graph_temperatures
    @klass.where('id % ? = 0', MINUTE_DIVISOR).last(25)
  end


end

