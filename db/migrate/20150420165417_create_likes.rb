class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id

      t.timestamps null: false
    end

    add_index :likes, :user_id
    add_index :likes, :post_id
    add_index :likes, :comment_id
    # add pair uniqueness - user cannot like the same post or comment more than once
    add_index :likes, [:user_id, :post_id], unique: true
    add_index :likes, [:user_id, :comment_id], unique: true
  end
end
