# frozen_string_literal: true
require 'rails_helper'

describe ChallengesImporter do
  describe '#import' do
    it do
      challenges_csv = "title,description,type,url
First Exercise,The First Exercise piece of cake!,Ruby,http://zoi.com/first-exerc
Another one,Super Easy,Python,http://supercoder/another-one-python
Crazy one,You're not able to do that,Ruby,http://rubyjedi/super-hard"
      challenges = double(:challenges)
      expect(challenges).to receive(:create)
        .with(title: 'First Exercise',
              description: 'The First Exercise piece of cake!')
      expect(challenges).to receive(:create)
        .with(title: 'Crazy one', description: "You're not able to do that")
      type = 'Ruby'
      importer = described_class.new(challenges_csv, challenges)
      importer.import(type)
    end
  end
end
