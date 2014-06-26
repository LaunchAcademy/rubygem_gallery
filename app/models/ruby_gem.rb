class RubyGem < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy
end
