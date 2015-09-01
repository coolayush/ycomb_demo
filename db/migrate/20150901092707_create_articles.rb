class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :heading
      t.text :discription
      t.string :url

      t.timestamps null: false
    end
  end
end
