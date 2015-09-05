require 'ostruct'
require_relative "../../lib/temperature_handler"
require_relative "../../lib/sms_notifier"

describe TemperatureHandler do

  describe '#temperature_created' do
    let(:model) { OpenStruct.new(temperature: temperature) }

    context 'temperature lower than low threshold' do
      let(:temperature) { 65 }
      it 'calls notify' do
        expect_any_instance_of(SMSNotifier).to receive(:notify)
        described_class.new.temperature_created(model)
      end
    end
    context 'temperature ok' do
      let(:temperature) { 70 }
      it 'does not call notify' do
        expect_any_instance_of(SMSNotifier).not_to receive(:notify)
        described_class.new.temperature_created(model)
      end
    end
    context 'temperature higher than high threshold' do
      let(:temperature) { 75 }
      it 'calls notify' do
        expect_any_instance_of(SMSNotifier).to receive(:notify)
        described_class.new.temperature_created(model)
      end
    end
  end

end
