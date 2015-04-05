require 'selenium-webdriver'

describe 'Homepage' do
  before(:all) do
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.manage.timeouts.implicit_wait = 30
    @driver.manage.window.maximize

    @driver.get('http://demo.magentocommerce.com')
  end

  after(:all) do
    @driver.quit
  end

  it 'has a search field' do
    search_field = @driver.find_element(:name, 'q')
    expect(search_field).to_not be_nil
  end

  it 'has a language dropdown' do
    language_dropdown = @driver.find_element(:id, 'select-language')
    expect(language_dropdown).to_not be_nil
  end

  it 'shows an appropriate message if the shopping cart is empty' do
    cart = @driver.find_element(:css, 'div.header-minicart span.icon')
    cart.click
    cart_message = @driver.find_element(:css, 'p.empty')
    expect(cart_message.text).to eq('You have no items in your shopping cart.')
  end
end
