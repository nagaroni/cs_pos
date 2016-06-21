# frozen_string_literal: true
require 'rails_helper'

feature 'User access homepage' do
  scenario 'successfully' do
    user = create(:user)
    login_as user
    visit root_path
    expect(page).to have_content 'Code Saga Pós'
  end

  scenario 'sees his points' do
    user = create(:user)
    login_as user
    create(:started_challenge,
           user: user,
           points: 10,
           finished_at: Time.zone.now)
    solution = create(:solution)
    solution.comments.create(user: user)
    visit root_path

    expect(page).to have_content 'Code Saga Pós'
    expect(page).to have_content 'Você tem 15 pontos'
  end
end
