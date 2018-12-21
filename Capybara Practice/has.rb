require 'capybara'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'rspec'

Capybara.default_driver= :selenium_chrome
Capybara.default_max_wait_time= 10
Capybara.match = :first

class Aconex
    
    include RSpec::Matchers
    include Capybara::DSL

    def start
        visit 'file:///home/Apexit/sample.html'
    end
    
    def checker
        #print (has_button?(locator = 'submit'))
        #print has_css?('input')
        # within(:xpath, '//div[@class="sample"]')do
        #     print has_button?(locator='button')
        # end
        
    end
end

aconex= Aconex.new
aconex.start
aconex.checker