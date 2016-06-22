require 'rails_helper'

feature 'User creates a challenge' do
  scenario 'successfully' do
    login_as create(:user)

    visit new_challenge_path
    fill_form_and_submit(:challenge, :new, attributes_for(:challenge))

    expect(page).to have_content "com sucesso"
  end
end
