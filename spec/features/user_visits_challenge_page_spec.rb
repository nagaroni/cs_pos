# frozen_string_literal: true
require 'rails_helper'

feature 'User visits challenge page' do
  scenario 'successfully' do
    login_as create(:user)
    challenge = create(:challenge)
    visit challenge_path(challenge)

    expect(page).to have_content challenge.title
    expect(page).to have_content challenge.description
  end
end
