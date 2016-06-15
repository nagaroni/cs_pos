require 'rails_helper'

feature 'User finalizes a challenge' do
  scenario 'successfully' do
    user = create(:user)
    challenge = create(:challenge)
    create(:started_challenge, challenge: challenge, user: user)
    login_as user
    visit challenge_path(challenge)

    click_on 'Finalizar'

    expect(page).to have_content "Parabéns, desafio #{challenge.title}, concluído!"
  end
end
