# frozen_string_literal: true
require 'rails_helper'

describe CommentsQuery do
  describe 'query' do
    it do
      user = create(:user)
      comments = create_list(:comment, 3,
                             user: user,
                             commentable: create(:solution))
      query = described_class.new(user)
      expect(query.query).to eq comments
    end
  end
end
