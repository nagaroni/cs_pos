# frozen_string_literal: true
require 'rails_helper'

feature 'User comments a challenge' do
  scenario 'successfully' do
    user = create(:user)
    login_as user
    challenge = create(:challenge)

    visit challenge_path(challenge)

    fill_in 'Comentário', with: 'Legal!!!'
    click_on 'Comentar'

    expect(page).to have_content 'Legal!!!'
    expect(page).to have_content "Comentado por: #{user.login}"
  end
end
