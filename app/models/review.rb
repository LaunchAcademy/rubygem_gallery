class Review < ActiveRecord::Base
  validates :rating, presence: true, length: { in: 1..5 }
  validates :ruby_gem, presence: true

  belongs_to :ruby_gem
  belongs_to :user
  has_many :votes
end
