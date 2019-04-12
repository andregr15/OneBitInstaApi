class CreateHashtagMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_mappings do |t|
      t.references :hashtag, foreign_key: true
      t.references :hashtagable, polymorphic: true

      t.timestamps
    end
  end
end
