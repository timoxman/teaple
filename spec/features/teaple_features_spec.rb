require 'rails_helper'

feature 'teaple' do
  context '' do
    scenario '' do
      visit '/teaples'
      expect(page).to have_content 'No teaple profile yet'
      expect(page).to have_link 'Add your profile'
    end
  end
end