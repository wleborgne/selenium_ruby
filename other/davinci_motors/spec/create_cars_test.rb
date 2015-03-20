#!/usr/bin/env ruby
require 'selenium-webdriver'

# Create a new Firefox session
driver = Selenium::WebDriver.for(:firefox)
driver.manage.timeouts.implicit_wait = 30
driver.manage.window.maximize

# Get the main server page
driver.get('http://localhost:3000/')

button = driver.find_element(:link_text, 'New Car')
button.click

test_data = { car_make: 'Ford', car_model: 'Mustang',
              car_year: '1967', car_price: '2300' }

test_data.each do |field, value|
  text_field = driver.find_element(:id, field)
  text_field.send_keys(value)
end

button = driver.find_element(:name, 'commit')
button.click
