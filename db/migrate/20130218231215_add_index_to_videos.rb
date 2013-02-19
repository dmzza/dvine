class AddIndexToVideos < ActiveRecord::Migration
  def up
  	add_index :videos, :url, { :unique => true }
  end

  def down
  	remove_index :videos, :url
  end
end
