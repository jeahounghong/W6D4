# == Schema Information
#
# Table name: likes
#
#  id                 :bigint           not null, primary key
#  liked_content_type :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  liked_content_id   :integer          not null
#  liker_id           :integer          not null
#
# Indexes
#
#  index_likes_on_liked_content_id  (liked_content_id)
#  index_likes_on_liker_id          (liker_id)
#
class Like < ApplicationRecord

    validates :liked_content_id, :liker_id, presence: true

    belongs_to :liker,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :User

    belongs_to :liked_content, polymorphic: true,
        primary_key: :id,
        foreign_key: :liked_content_id,
        class_name: :liked_content_type

end
