require 'selenium-webdriver'

class CreateCarPage
  def initialize(driver)
    @driver = driver
    @driver.get('http://localhost:3000/')
  end
  
  def create_car(make = nil, model = nil, year = nil, price = nil)
    @driver.find_element(:link_text, 'New Car').click
    
    @driver.find_element(:id, 'car_make').send_keys(make)
    @driver.find_element(:id, 'car_model').send_keys(model)
    @driver.find_element(:id, 'car_year').send_keys(year)
    @driver.find_element(:id, 'car_price').send_keys(price)
    
    @driver.find_element(:name, 'commit').click
  end
  
  def message_displayed?(message)
    @driver.find_element(:text, message).displayed?
  end
end
