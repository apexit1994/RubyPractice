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
        visit 'https://internal-qa9.aconex.com/Logon'
    end

    def login(username, password)
        # find('#userName').set 'poleary'
        fill_in 'Login Name' , with: username
        # find('#password').set 'C3rtifi3d'
        fill_in 'Password', with: password
        click_button 'Log in'
        sleep 2
    end

    def clickWorkflow
        find('.uiButton-content', text: 'Workflows').click

        # click_button 'Workflow'
        
        sleep 2
         find('.navBarPanel-menuItem', text: 'Assigned to me').click
         sleep 5
    end

    # def verify
    #     expect(find('.nav-userDetails', wait: 30)).to have_text 'Patrick'
    # end
end

aconex= Aconex.new
aconex.start
aconex.login 'poleary' , 'ac0n3x11'
aconex.clickWorkflow
#aconex.verify