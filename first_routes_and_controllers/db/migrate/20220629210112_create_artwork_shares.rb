class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artist_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end

    add_index :artwork_shares, :artist_id#, :viewer_id
    add_index :artwork_shares, [:viewer_id, :artist_id], unique: true
  end
end
