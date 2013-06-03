require 'spec_helper'

describe Forecast do
  describe '.new' do
    it 'creates an instance of a Forecast' do
      forecast = Forecast.new
      expect(forecast).to be_an_instance_of(Forecast)
    end
  end

  describe '#get_city' do
    it 'finds the state and city of the zip code' do
      forecast = Forecast.new
      zip_code = '10014'
      expect(forecast.get_city(zip_code)).to eq ["NY", "New York"]
    end
  end

  describe 'get_temp' do
    it 'returns the temp for a valid zip location' do
      forecast = Forecast.new
      location = ["NY", "New York"]
      expect(forecast.get_temp(location)).to_not be nil
    end
  end

  describe '#validate_zip' do
    it 'validates a zip code that is 5 characters long, and only contains digits' do
      forecast = Forecast.new
      zip_code = '10014'
      expect(forecast.validate_zip(zip_code)).to eq nil
    end
    it 'returns true if zip is less than five characters' do
      forecast = Forecast.new
      zip_code = '1001'
      expect(forecast.validate_zip(zip_code)).to eq true
  end
    it 'returns true if zip is more than five characters' do
      forecast = Forecast.new
      zip_code = '100165'
      expect(forecast.validate_zip(zip_code)).to eq true
  end
    it 'returns true if zip contains a non-digit character' do
      forecast = Forecast.new
      zip_code = '1001t'
      expect(forecast.validate_zip(zip_code)).to eq true
  end
    it 'returns true if zip contains a space' do
      forecast = Forecast.new
      zip_code = '10 14'
      expect(forecast.validate_zip(zip_code)).to eq true
  end
    it 'returns true if zip contains a non-digit character' do
      forecast = Forecast.new
      zip_code = '10-14'
      expect(forecast.validate_zip(zip_code)).to eq true
  end
end

end
