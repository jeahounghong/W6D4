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
require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
