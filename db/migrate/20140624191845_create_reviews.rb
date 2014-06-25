class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body
      t.integer :ruby_gem_id, null: false
    end
  end
end
