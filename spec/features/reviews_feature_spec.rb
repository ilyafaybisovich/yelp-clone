require 'rails_helper'
feature 'reviewing' do
  before { Restaurant.create(name: 'KFC') }

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'So so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq('/restaurants')
    expect(page).to have_content('So so')
  end

  scenario 'deleting restaurants deletes the reviews' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'So so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Delete KFC'
    expect(Review.all.length).to be(0)
  end
end
