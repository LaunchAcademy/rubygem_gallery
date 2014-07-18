class Vote < ActiveRecord::Base
  validates :direction, presence: true, inclusion: { in: [1, -1] }
  validates :user, presence: true
  validates :review, presence: true, uniqueness: { scope: :user }

  belongs_to :user
  belongs_to :review, dependent: :destroy, counter_cache: true
end
