class CreateSubComments < ActiveRecord::Migration
  def change
    create_table :sub_comments do |t|
      t.text :message

      t.integer :user_id
      t.integer :lesson_id
      t.integer :comment_id
      t.timestamps
    end
    add_index :sub_comments, [:user_id, :lesson_id, :comment_id]
    add_index :sub_comments, :comment_id
  end
end
