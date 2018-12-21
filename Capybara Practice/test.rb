require 'capybara'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'rspec'

Capybara.default_driver= :selenium_chrome
Capybara.default_max_wait_time= 10

class Aconex
    include RSpec::Matchers
    include Capybara::DSL

    def start
        visit 'https://qa121.aconex.com'
    end

    def login(username, password)
        # find('#userName').set 'poleary'
        fill_in 'Login Name' , with: username
        # find('#password').set 'C3rtifi3d'
        fill_in 'Password', with: password
        click_button 'Log in'
    end

    def verify
        expect(find('.nav-userDetails', wait: 30)).to have_text 'Patrick'
    end
end

aconex= Aconex.new
aconex.start
aconex.login 'poleary' , 'C3rtifi3d'
aconex.verify