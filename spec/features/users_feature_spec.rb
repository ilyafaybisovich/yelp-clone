require 'rails_helper'

context 'user is not signed and on the homepage' do
  it 'should see a sign-in link and a sign-up link' do
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
  end

  it 'should not see the sign-out link' do
    visit '/'
    expect(page).not_to have_link 'Sign out'
  end
end

context 'the user is signed in on the homepage' do
  before do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'dan.blakeman@oxen.com'
    fill_in 'Password', with: 'five_oxes'
    fill_in 'Password confirmation', with: 'five_oxes'
    click_button 'Sign up'
  end

  it 'should see the sign-out link' do
    visit '/'
    expect(page).to have_link 'Sign out'
  end

  it 'should not see a sign-in link or a sign-up link' do
    visit '/'
    expect(page).not_to have_link 'Sign in'
    expect(page).not_to have_link 'Sign up'
  end
end