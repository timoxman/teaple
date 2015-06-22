require 'rails_helper'

feature 'teaple' do
  context 'new user can see a link to add profile' do
    scenario 'user visits the main page' do
      visit '/'
      expect(page).to have_link 'Add your profile'
    end
  end

  context 'user adds new profile' do
    scenario 'user clicks link and adds details' do
      visit '/'
      click_link "Add your profile"
      fill_in 'Name', with: "Betty"
      click_button 'Save profile'
      expect(page).to have_content 'Thanks for signing up, Betty!'
      # expect(page).not_to have_link 'Add your profile'
      expect(current_path).to eq '/'
    end
  end
end
