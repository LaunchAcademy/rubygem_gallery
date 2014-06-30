class MemberMailer < ActiveRecord::Base
  validates :ruby_gem_id, null: false
  validates :review_id, null: false

  belongs_to :ruby_gem
  has_one :review
end
