require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set :show_exceptions, false

describe 'the pet path', :type => :feature do
  before :each do
    visit '/'
  end

  it 'takes you to a form where you can fill out the name of your pet' do
    expect(page).to have_css 'input#name'
  end

  it 'takes you to your new pet after giving it a name' do
    fill_in :name, :with => 'foo'
    click_button 'Go!'
    expect(page).to have_content 'foo'
  end

  it 'has a group of 3 links that make the pet eat, sleep, or play' do
    fill_in :name, :with => 'foo'
    click_button 'Go!'
    expect(page).to have_css('.actions li', :count => 3)
    expect(page).to have_css 'li.pet-eat'
    expect(page).to have_css 'li.pet-sleep'
    expect(page).to have_css 'li.pet-play'
  end
  
  it 'will take the user to an updated view of the pet details' do
    fill_in :name, :with => 'foo'
    click_button 'Go!'
    sleep 1
    click_link 'foo'
    expect(page).to have_content 'foo'
    expect(page).to have_css('li.food-level', :text => 9)
    expect(page).to have_css('li.sleep-level', :text => 9)
    expect(page).to have_css('li.activity-level', :text => 9)
    click_link 'Feed me'
    click_link 'Put me to sleep'
    expect(page).to have_css('li.food-level', :text => 10)
    expect(page).to have_css('li.sleep-level', :text => 10)
    expect(page).to have_css('li.activity-level', :text => 9)
    sleep 2
    click_link 'Play with me'
    expect(page).to have_css('li.food-level', :text => 80)
    expect(page).to have_css('li.sleep-level', :text => 8)
    expect(page).to have_css('li.activity-level', :text => 8)
  end
end
