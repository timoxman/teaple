module Helpers

    def sign_up(email='test@example.com')
      visit '/'
      click_link 'Sign up'
      fill_in "Email", with: email
      fill_in "Password", with: 'testtest'
      fill_in "Password confirmation", with: 'testtest'
      click_button 'Sign up'
    end

    def sign_out
      visit '/'
      click_link 'Sign out'
    end

    def add_teaple(name='Betty')
      visit '/'
      click_link "Add your profile"
      fill_in 'Name', with: name
      click_button 'Save profile'
    end

end
