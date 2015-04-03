#!/usr/bin/env ruby
require 'selenium-webdriver'

# Create a new Firefox session
driver = Selenium::WebDriver.for(:firefox)
# In the book, the methods .implicitly_wait()
# and .maximize_window are called directly on the Driver
# object.  In Ruby bindings, they are reached via the Options
# returned from the Driver .manage method
driver.manage.timeouts.implicit_wait = 30
driver.manage.window.maximize

# URL in book is a bit unstable, and may not always
# be available
# navigate to the application homepage
driver.get('http://demo.magentocommerce.com')

# get the search textbox
# Book uses .find_element_by_name, but in the Ruby docs, this
# method is part of the private API, and is not recommended for use
search_field = driver.find_element(:name, 'q')
search_field.clear

# enter search keyword and submit
search_field.send_keys('phones')
search_field.submit

# get all the anchor elements which have product names displayed
# currently on result page using find_elements(:xpath, '')
products = driver.find_elements(:xpath, "//h2[@class='product-name']/a")

# get the number of anchor elements found
puts "Found #{products.length} products:"

# iterate through each anchor element and print the text that is
# name of product
products.each do |product|
  puts product.text
end

# close the browser window
driver.quit
