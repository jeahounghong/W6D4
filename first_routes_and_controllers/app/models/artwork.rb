# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer          not null
#
# Indexes
#
#  index_artworks_on_artist_id_and_title  (artist_id,title) UNIQUE
#
class Artwork < ApplicationRecord
    validates :image_url, :title, :artist_id, presence: true
    validates :title, uniqueness: {scope: :artist_id}

    belongs_to :artist,
        primary_key: :id, 
        foreign_key: :artist_id, 
        class_name: :User

    has_many :shares, dependent: :destroy,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare
    
    has_many :shared_users,
        through: :shares, 
        source: :viewer

    has_many :comments, dependent: :destroy,
        primary_key: :id,
        foreign_key: :artwork_id, 
        class_name: :Comment 

    has_many :likes, as: :liked_content, dependent: :destroy,
        primary_key: :id,
        foreign_key: :liked_content_id,
        class_name: :Like
end
