require 'selenium-webdriver'
include Capybara::DSL

Before do
    Capybara.page.driver.browser.manage.window.maximize
    @HomePage = HomePage.new
    @LoginPage = LoginPage.new
    @RegisterPage = RegisterPage.new
    @AutoQuote = AutoQuote.new
end

Before ('@loginSuccess') do
    @HomePage.url
    @HomePage.clickMyAccount
    @LoginPage.login('email', 'senha', 'corretos')
end

After do
    Capybara.reset_sessions!
end

After do |scenario|
    nome_cenario = scenario.name.tr(' ', '_').downcase!
    nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    screenshot = "logs/shots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    attach(screenshot, 'image/png')
end