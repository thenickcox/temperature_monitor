require 'rails_helper'

describe TemperatureReading do

  describe '#save' do
    it 'publishes an event (to be subscribed to)' do
      expect { TemperatureReading.create(temperature: 68) }.to broadcast(:temperature_created)
    end
  end

end
