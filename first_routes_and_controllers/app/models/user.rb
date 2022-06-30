# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username)
#
class User < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :artworks, dependent: :destroy,
        primary_key: :id, 
        foreign_key: :artist_id, 
        class_name: :Artwork

    has_many :shares, dependent: :destroy,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :shares,
        source: :artwork

    has_many :comments, dependent: :destroy,
        primary_key: :id, 
        foreign_key: :commenter_id, 
        class_name: :Comment 

    
end
