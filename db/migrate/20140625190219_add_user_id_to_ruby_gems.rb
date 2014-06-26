class AddUserIdToRubyGems < ActiveRecord::Migration
  def change
    add_column :ruby_gems, :user_id, :integer
  end
end
