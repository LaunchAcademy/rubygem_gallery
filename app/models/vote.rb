class Vote < ActiveRecord::Base
  validates :review_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validates :direction, presence: true, inclusion: { in: [1, -1] }

  belongs_to :user
  belongs_to :review, dependent: :destroy, counter_cache: true
end
