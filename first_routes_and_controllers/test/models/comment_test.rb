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
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
