class CreateArticlesUsers < ActiveRecord::Migration
  def change
    create_table :articles_users do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :articles_users, :user_id
    add_index :articles_users, :article_id
    add_index :articles_users, [:user_id, :article_id], unique: true
  end
end
