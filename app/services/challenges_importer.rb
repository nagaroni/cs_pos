require 'csv'
class ChallengesImporter
  def initialize(challenges_csv, challenges = Challenge)
    @challenges_csv = CSV.parse(challenges_csv, headers: true)
    @challenges = challenges
  end

  def import(type)
    @challenges_csv.each do |challenge|
      next if challenge['type'].downcase != type.downcase
      @challenges
        .create(title: challenge['title'], description: challenge['description'])
    end
    # @challenges_csv
    #   .map
    #   .select{|row| row['type'].downcase == type.downcase}
    #   .each { |challenge| Challenge.create(challenge.to_hash.slice('type','description')) }
  end
end
