class CreateMemberMailers < ActiveRecord::Migration
  def change
    create_table :member_mailers do |t|
      t.integer :ruby_gem_id, null: false
      t.integer :review_id, null: false
      t.timestamps
    end
  end
end
