class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :introduction
      t.text :content
      t.string :platform
      t.integer :rating_category

      t.timestamps
    end
  end
end
