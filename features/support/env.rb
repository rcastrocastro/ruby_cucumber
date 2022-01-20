require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'pry'
require 'pry-nav'
require 'pry-remote'
require 'report_builder'
require 'rspec'
require 'selenium-webdriver'

require_relative 'helpers'

World(Helpers) # deixando o arquivo helpers visivel para todos, precisa dar o include no arquivo helpers include Capybara::DSL
#include Helpers # deixando o arquivo helpers visivel para todos, nao preciso dar o include no arquivo helpers ex include Capybara::DSL

CONFIG = YAML.load_file("features/support/config/environments/#{ENV['ENV_TYPE']}.yaml")
EL = YAML.load_file('features/support/config/elements.yaml')

@browser = ENV['BROWSER']

Capybara.configure do |c|
  case @browser
  when 'chrome'
    @driver = :selenium_chrome
  when 'chrome_headless'
    Capybara.register_driver :selenium_chrome_headless do |app|
      chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
        options.add_argument "--headless"
        options.add_argument "--disable-gpu"
        options.add_argument "--no-sandbox"
        options.add_argument "--disable-site-isolation-trials"
      end
      Capybara::Selenium::Driver.new(app,
                                     browser: :chrome,
                                     options: chrome_options)
    end
    @driver = :selenium_chrome_headless
  end
  
  c.default_driver = @driver
  c.app_host = CONFIG['URL_SP4']
  c.default_max_wait_time = 10
end
