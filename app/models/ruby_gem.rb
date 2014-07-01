class RubyGem < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      find(:all)
    end
  end
end
