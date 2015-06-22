require 'rails_helper'

feature 'teaples' do
  context 'have not been added' do
    scenario 'display a message' do
        visit '/teaples'
        expect(page).to have_content 'No teaples added yet'
    end
  end

  context 'have been added' do
    scenario 'display some teaples' do
      Teaple.create(name: 'Elsie')
      visit '/teaples'
      expect(page).to have_content 'Elsie'
      expect(page).not_to have_content 'No teaples added yet'
    end
  end

end
