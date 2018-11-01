class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.string :anonymous_goossiper
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :like, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
