class AddCaptionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :caption, :string
  end
end
