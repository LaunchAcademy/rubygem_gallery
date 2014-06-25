class RemoveTimestampsFromReveiws < ActiveRecord::Migration
  def up
    remove_column :reviews, :timestamps
  end

  def down
    add_column :reviews, :timestamps, :datetime
  end
end
