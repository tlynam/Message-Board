class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts_tables do |t|
      t.references :user, index: true
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
