# frozen_string_literal: true
require 'rails_helper'

feature 'User access other\'s solution' do
  context 'without his own solution' do
    scenario 'and is redirect to root page' do
      solution = create(:solution)
      login_as create(:user)

      visit solution_path(solution)

      expect(page)
        .not_to have_content solution.started_challenge.challenge.title
      expect(current_path).to eq root_path
    end
  end

  context 'with his own solution' do
    scenario 'and sees it successfully' do
      user = create(:user)
      started_challenge = create(:started_challenge, user: user)
      solution = create(:solution, started_challenge: started_challenge)

      other_user = create(:user, email: 'mail@mail.com')
      create(:solution,
             started_challenge: create(:started_challenge,
                                       challenge: started_challenge.challenge,
                                       user: other_user))

      login_as other_user

      visit solution_path(solution)

      expect(page).to have_content solution.started_challenge.challenge.title
    end
  end
end
