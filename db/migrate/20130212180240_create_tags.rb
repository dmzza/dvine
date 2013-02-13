class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
  	end

  	create_table :tags_videos do |t|
  		t.references :tag
  		t.references :video
  	end

  	add_index :tags_videos, :tag_id
  	add_index :tags_videos, :video_id
  end
end
