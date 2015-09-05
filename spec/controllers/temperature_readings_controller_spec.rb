require 'rails_helper'

describe TemperatureReadingsController do
  let!(:temp) { TemperatureReading.create(temperature: 68.0) }
  describe 'GET index' do
    before { get :index }
    it 'instantiates the presenter' do
      expect(assigns[:pres]).to be_an_instance_of(TemperaturePresenter)
    end
  end

  describe 'POST create' do
    let(:temp)   { 70 }
    let(:params) {{ temperature: temp }}

    context 'posting' do
      before { post :create, params }
      it 'responds with a 200' do
        expect(response.status).to eq(200)
      end
      it 'creates a temperature reading' do
        expect(TemperatureReading.last.temperature).to eq(temp)
      end
    end

    #context 'works via a curl request' do
      #it 'works' do
        #request.host = 'localhost:3000'
        #curl = "curl -X POST -d 'temperature_reading[temperature]=68' #{temperature_readings_url(format: 'json')}"
        #system curl
        #expect(TemperatureReading.last.temperature).to eq(68)
      #end
    #end
  end

end

