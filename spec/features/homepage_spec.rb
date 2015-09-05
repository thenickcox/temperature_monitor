require 'rails_helper'

describe 'homepage', type: :feature do

  before :each do
    TemperatureReading.create(temperature: 68)
    TemperatureReading.last.update_attribute(:created_at, Time.new('2015-01-01 00:00:00'))
    visit root_path
  end

  it 'shows the temperature' do
    within '.temp' do
      expect(page).to have_content(68)
    end
  end

  it 'formats the temperature correctly' do
    small = find('h1 small')
    expect(small).to have_content('12:00')
  end


end
