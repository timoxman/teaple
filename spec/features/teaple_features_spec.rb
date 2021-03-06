require 'rails_helper'

require_relative 'helpers'
include Helpers

feature 'teaple' do
  context 'new user can see a link to add profile' do
    scenario 'user visits the main page (t01)' do
      visit '/'
      expect(page).to have_link 'Add your profile'
    end
  end

  context 'have not been added' do
    scenario 'display a message (t02)' do
        visit '/teaples'
        expect(page).to have_content 'No teaples added yet'
    end
  end

  context 'have been added' do
    scenario 'display some teaples (t03)' do
      Teaple.create(name: 'Elsie')
      visit '/teaples'
      expect(page).to have_content 'Elsie'
      expect(page).not_to have_content 'No teaples added yet'
    end
  end

  context 'user adds new profile' do
    scenario 'user clicks link and adds details (t04)' do
      sign_up(email="test@test.com")
      visit '/'
      click_link "Add your profile"
      fill_in 'Name', with: "Betty"
      fill_in 'Bio', with: "Utter maniac"
      fill_in 'Location', with: "Bexley"
      fill_in 'Postcode', with: "LU7 OSR"
      click_button 'Save profile'
      expect(page).to have_content 'Thanks for signing up, Betty!'
      expect(current_path).to eq '/'
    end
  end

  context 'once a teaple has been created you can arrange a meeting with the teaple' do
    scenario 'user adds a teaple and can see a link to arrange a meeting (t05)' do
      sign_up(email="test@test.com")
      add_teaple("Martha")
      expect(page).to have_link 'Arrange meeting'
    end

    scenario 'user can leave a message on teaple page (t06)' do
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
    #let!(:betty){Teaple.create(name:"Betty", postcode: "LU7 OSR")}
    scenario 'lets a volunteer view a teaple profile (t07)' do
      sign_up(email="test@test.com")
      add_teaple('Betty')
      visit '/'
      click_link 'Betty'
      @betty = Teaple.find_by(name: "Betty")
      expect(page).to have_content 'Betty'
      expect(current_path).to eq "/teaples/#{@betty.id}"
    end
  end

  context 'messages' do
    scenario 'hide private messages from other users (t08)' do
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

  scenario 'location of a teaple can be displayed (t09)' do
    Teaple.stub(:geocoded_by).and_return([51.8452049, -0.6655192])
    sign_up(email="test@test.com")
    add_teaple("Betty")
    visit '/'
    click_link 'Betty'
    #content on page has been removed, you are never going to find this!!
    expect(page).to have_content("51.8452049, -0.6655192")
  end

end
