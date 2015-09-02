class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.integer :likes
      t.timestamps null: false
    end
  end
end
