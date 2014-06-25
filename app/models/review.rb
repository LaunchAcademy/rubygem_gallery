class Review < ActiveRecord::Base
  validates :rating, presence: true, length: { in: 1..5 }
  validates :ruby_gem_id, presence: true

  belongs_to :ruby_gem
end
