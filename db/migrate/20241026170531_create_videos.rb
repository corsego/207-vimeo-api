class CreateVideos < ActiveRecord::Migration[7.2]
  def change
    create_table :videos do |t|
      t.json :vimeo_payload

      t.timestamps
    end
  end
end