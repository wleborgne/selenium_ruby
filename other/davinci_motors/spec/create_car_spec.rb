# require 'rails_helper'
require_relative './create_car_page'

describe 'Creating Cars' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 30
    @driver.manage.window.maximize
    @create_car_page = CreateCarPage.new(@driver)
  end
  
  # after(:each) do
  #   @driver.quit
  # end
  
  it 'can create a car' do
    @create_car_page.create_car('Ford', 'Mustang', '1967', '2300')
    
    expect(@create_car_page.message_displayed?('1967 Ford Mustang created')).to be_truthy
  end
end
