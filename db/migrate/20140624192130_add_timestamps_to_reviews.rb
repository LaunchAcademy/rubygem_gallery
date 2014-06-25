class AddTimestampsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :timestamps, :datetime
  end
end
