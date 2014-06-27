class AddCountercacheToReviews < ActiveRecord::Migration
  def up
    add_column :reviews, :votes_count, :integer, default: 0

    Review.find_each do |review|
      review.votes_count = review.votes.count
      review.save!
    end
  end

  def down
    remove_column :reviews, :votes_count
  end
end
