require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates a word and then goes to the  homepage') do
    visit('/homepage/new')
    fill_in('word_new', :with => 'procrastinate')
    click_on('Go!')
    expect(page).to have_content('procrastinate')
  end
end

describe('create an definition path', {:type => :feature}) do
  it('creates definition and then adds it to the list') do
    word = Word.new("procrastinate",nil)
    word.save
    visit("/homepage/#{word.id}")
    fill_in('word_def', :with => 'to delay')
    click_on('go!')
    expect(page).to have_content('to delay')
  end
end