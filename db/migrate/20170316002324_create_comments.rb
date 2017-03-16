class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true
      t.references :user, index: true

      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
