require 'rails_helper'

describe TemperaturePresenter do

  describe '#graph_temperatures' do
    let(:temperature) { TemperatureReading.create(temperature: 68) }
    before { temperature.update_column(:id, id) }
    subject { described_class.new(TemperatureReading).graph_temperatures.include?(temperature) }
    context 'id is not multiple of 15' do
      let(:id) { 8 }
      it 'excludes record' do
        expect(subject).to eq(false)
      end
    end
    context 'id is multiple of 15' do
      let(:id) { 15 }
      it 'includes record' do
        expect(subject).to eq(true)
      end
    end
  end

end
