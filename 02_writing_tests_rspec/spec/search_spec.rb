require 'selenium-webdriver'

describe 'Search' do
  # if :each is specified, equivalent to the setUp method from the examples,
  # where the method is executed before each test case
  # if :all is specified, equivalent to the setUpClass method, where
  # it is executed only once, prior to any tests being run
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.manage.timeouts.implicit_wait = 30
    @driver.manage.window.maximize

    @driver.get('http://demo.magentocommerce.com')
  end

  # similar to 'before', :each causes execution after each test cat, :all
  # causes execution only after all tests have been executed
  after(:all) do
    @driver.quit
  end

  it 'returns 3 products when searching for \'phones\'' do
    # find and clear the search box
    search_field = @driver.find_element(:name, 'q')
    search_field.clear

    # enter the search phrase and submit the form
    search_field.send_keys('phones')
    search_field.submit

    # find all elements of the 'product-name' class
    products = @driver.find_elements(:xpath, "//h2[@class='product-name']/a")

    # expect 3 products
    expect(products.count).to eq(3)
  end

  it 'returns 1 product when searching for \'salt shaker\'' do
    # find and clear the search box
    search_field = @driver.find_element(:name, 'q')
    search_field.clear

    # enter the search phrase and submit the form
    search_field.send_keys('salt shaker')
    search_field.submit

    # find all elements of the 'product-name' class
    products = @driver.find_elements(:xpath, "//h2[@class='product-name']/a")

    # expect 1 products
    expect(products.count).to eq(1)
  end
end
