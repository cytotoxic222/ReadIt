class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :text
      t.string :author
      t.belongs_to :book

      t.timestamps
    end
  end
end
