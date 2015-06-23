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
      sign_up(email="test@test.com")
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
      sign_up(email="test@test.com")
      add_teaple("Martha")
      expect(page).to have_link 'Arrange meeting'
    end

    scenario 'user can leave a message on teaple page' do
      sign_up(email="test@test.com")
      add_teaple
      visit '/'
      click_link "Arrange meeting"
      fill_in "Message", with: "Please meet me"
      click_button 'Arrange Meeting'
      expect(page).to have_content("Please meet me")
    end

  end

  context 'viewing teaple' do
    let!(:betty){Teaple.create(name:"Betty")}
    scenario 'lets a volunteer view a teaple profile' do
      visit '/'
      click_link 'Betty'
      expect(page).to have_content 'Betty'
      expect(current_path).to eq "/teaples/#{betty.id}"
    end
  end


  context 'messages' do
    scenario 'hide private messages from other users' do
      sign_up(email="test@test.com")
      add_teaple("Betty123")
      click_link('Arrange meeting')
      fill_in 'Message', with: "Heya let us meet"
      click_button 'Arrange Meeting'
      expect(page).to have_content "Heya let us meet"
      @betty = Teaple.find_by(name: "Betty123")
      sign_out
      sign_up(email="test1@test.com")
      visit "/teaples/#{@betty.id}/messages"
      expect(page).not_to have_content "Heya let us meet"


    end
  end



end
