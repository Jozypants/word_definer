# require('capybara/rspec')
# require('./app')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)

# describe('create an word path', {:type => :feature}) do
#   it('creates an word and then goes to the  homepage') do
#     visit('/homepage')
#     click_on('Add a new word')
#     fill_in('word to define', :with => 'procrastinate')
#     click_on('Go!')
#     expect(page).to have_content('procrastinate')
#   end
# end