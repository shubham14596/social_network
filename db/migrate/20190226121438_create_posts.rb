class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :timestamp
      t.string :content
      t.timestamps
    end

    add_column :posts, :user_id, :integer
  end
end
