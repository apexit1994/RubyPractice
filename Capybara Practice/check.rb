require 'capybara'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'rspec'
require 'pry'

Capybara.default_driver= :selenium_chrome
Capybara.default_max_wait_time= 10

class Aconex
    include RSpec::Matchers
    include Capybara::DSL

    def start
        visit 'http://jkorpela.fi/forms/testing.html'
        
    end

    def login
        within('form[action="http://jkorpela.fi/cgi-bin/echo.cgi"') do
            check('box')
        end
    end

    def verify_check_box_has_been_checked
        binding.pry
        expect(find('form[action="http://jkorpela.fi/cgi-bin/echo.cgi"')).to have_checked_field
    end
end

aconex= Aconex.new
aconex.start
aconex.login
aconex.verify_check_box_has_been_checked