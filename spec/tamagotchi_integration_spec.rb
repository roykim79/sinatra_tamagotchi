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
    expect(page).to have_css('li a', :count => 3)
    expect(page).to have_css 'li.pet-eat'
    expect(page).to have_css 'li.pet-sleep'
    expect(page).to have_css 'li.pet-play'
  end

  it 'will take the user to an updated view of the pet details' do
    fill_in :name, :with => 'foo'
    click_button 'Go!'
    click_link 'foo'
    expect(page).to have_content 'foo'
    expect(page).to have_css('li.food-level', :text => 10)
    expect(page).to have_css('li.sleep-level', :text => 10)
    expect(page).to have_css('li.activity-level', :text => 10)
  end
end
