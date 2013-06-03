require 'spec_helper'

describe 'Forecast' do
  describe 'GET /' do
    it 'displays the zip code form' do
      visit root_path
      page.should have_button('Get Forecast')
    end

    it 'displays the forecast for a valid zipcode' do
      visit root_path
      fill_in('zip_code', :with => '10014')
      click_button('Get Forecast')
      page.should have_text('New York')
    end

    it 'displays an error for an invalid zipcode' do
      visit root_path
      fill_in('zip_code', :with => '35832')
      click_button('Get Forecast')
      page.should have_text('zipcode not found')
    end

    it 'displays an error for an input that does not match the zipcode format' do
      visit root_path
      fill_in('zip_code', :with => '10 14')
      click_button('Get Forecast')
      page.should have_text('invalid zip code format')
    end
  end
end
