class Vote < ActiveRecord::Base
  validates :review, presence: true, uniqueness: { scope: :user }
  validates :user, presence: true
  validates :direction, presence: true, inclusion: { in: [1, -1] }

  belongs_to :user
  belongs_to :review, dependent: :destroy, counter_cache: true
end
