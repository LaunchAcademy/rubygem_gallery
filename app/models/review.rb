class Review < ActiveRecord::Base
  validates :rating, presence: true, inclusion: { within: 1..5 }
  validates :ruby_gem, presence: true

  belongs_to :ruby_gem
  belongs_to :user
  has_many :votes

  def vote_count
    vote_values = []
    if !votes.empty?
      votes.each do |vote|
        vote_values << vote.direction
      end
      vote_values.inject { |sum, vote| sum + vote }
    else
      0
    end
  end
end

# Review.all.to_a.sort_by(&:vote_count)
# Review.all.to_a.sort!{ |a, b| a.vote_count <=> b.vote_count }
