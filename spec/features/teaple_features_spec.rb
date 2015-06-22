require 'rails_helper'

require_relative 'helpers'
include Helpers

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

  context 'once a teaple has been created you can arrange a meeting with the teaple' do
    scenario 'user adds a teaple and can see a link to arrange a meeting' do
      add_teaple("Martha")
      expect(page).to have_link 'Arrange meeting'
    end

    scenario 'user can leave a message on teaple page' do
      add_teaple
      click_link "Arrange meeting"
      fill_in "Message", with: "Please meet me"
      click_button 'Arrange Meeting'
      expect(page).to have_content("Please meet me")
    end

  end



end
