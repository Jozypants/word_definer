require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the  homepage') do
    visit('/homepage/new')
    # save_and_open_page
    # click_on('Add a word!')
    fill_in('word_new', :with => 'procrastinate')
    click_on('Go!')
    expect(page).to have_content('procrastinate')
  end
end