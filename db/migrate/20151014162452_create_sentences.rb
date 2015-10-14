class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :content
      t.integer :story_id
      t.integer :image_id
      t.string :username

      t.timestamps
    end

    create_table :images do |t|
      t.string :url

      t.timestamps
    end
  end
end
