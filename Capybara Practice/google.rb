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
        visit 'file:///home/Apexit/Downloads/tooltip.html'
        
    end

    def login(search)
        # find('#userName').set 'poleary'
        page.find('#tt', wait:5).hover
    end
    def verify
        expect(find('#ttt')).to have_text 'Organisation Administrators can add'
        sleep 4
    end
end

aconex= Aconex.new
aconex.start
aconex.login 'jenkins not working'
aconex.verify