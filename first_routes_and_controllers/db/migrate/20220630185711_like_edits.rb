class LikeEdits < ActiveRecord::Migration[5.2]
  def change
      add_column :likes, :liked_content_type, :string, null: false
      rename_column :likes, :liked_id, :liked_content_id
  end
end
