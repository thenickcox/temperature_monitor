class TemperatureReading < ActiveRecord::Base
  include Wisper::Publisher
  after_create :publish_temperature_created

  private

  def publish_temperature_created
    broadcast(:temperature_created, self)
  end
end
