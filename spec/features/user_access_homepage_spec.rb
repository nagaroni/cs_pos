require 'rails_helper'

feature 'User access homepage' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content 'Code Saga Pós'
  end
end
