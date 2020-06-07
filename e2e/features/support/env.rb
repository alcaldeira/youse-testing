require 'rspec'
require 'capybara'
require 'cucumber'
require 'pry'
require 'yaml'
require 'faker'
require 'cpf_faker'
require 'ffaker'
require 'site_prism'
require 'capybara/rspec'
require 'selenium-webdriver'
require "base64"

World(Capybara::DSL)

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 30
  config.app_host = 'https://www.youse.com.br'
end

RSpec.configure do |conf|
  conf.include RSpec::Matchers  
end