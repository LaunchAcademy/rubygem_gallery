class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :ruby_gems
  has_many :reviews
  has_many :votes

  def vote?(review)
    vote = votes.where(review: review).first
    if vote
      vote.direction
    end
  end

  def vote(review)
    Vote.find_by(review: review)
  end
end
