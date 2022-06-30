# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  artwork_id   :integer          not null
#  commenter_id :integer          not null
#
# Indexes
#
#  index_comments_on_artwork_id    (artwork_id)
#  index_comments_on_commenter_id  (commenter_id)
#
class Comment < ApplicationRecord

    validates :artwork_id, :commenter_id, presence: true

    belongs_to :commenter,
        primary_key: :id,
        foreign_key: :commenter_id,
        class_name: :User

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork

    has_many :likes, as: :liked_content, dependent: :destroy,
        primary_key: :id,
        foreign_key: :liked_content_id,
        class_name: :Like
    
end
