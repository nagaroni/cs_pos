# frozen_string_literal: true
require 'csv'

class ChallengesImporter
  def initialize(challenges_csv, challenges = Challenge)
    @challenges_csv = CSV.new(challenges_csv, headers: true)
    @challenges = challenges
  end

  def import(type)
    @challenges_csv
      .select { |row| row['type'].casecmp(type.downcase).zero? }
      .each { |challenge| create_challenge(challenge) }
  end

  private

  def create_challenge(challenge)
    @challenges
      .create(title: challenge['title'], description: challenge['description'])
  end
end
