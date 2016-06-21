# frozen_string_literal: true
require 'rails_helper'

feature 'User starts a challenge' do
  scenario 'successfully' do
    user = create(:user)
    login_as user
    challenge = create(:challenge)
    visit challenge_path(challenge)

    click_on 'Iniciar'

    expect(page).to have_content challenge.title
    expect(page).to have_content 'Iniciado'
  end
end
