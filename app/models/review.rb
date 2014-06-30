class Review < ActiveRecord::Base
  validates :rating, presence: true, inclusion: { within: 1..5 }
  validates :ruby_gem, presence: true

  belongs_to :ruby_gem
  belongs_to :user
  has_many :votes
  has_one :member_mailer

  def vote_count
    votes.sum(:direction)
  end
end
