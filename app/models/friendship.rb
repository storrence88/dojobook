# == Schema Information
#
# Table name: friendships
#
#  id         :bigint(8)        not null, primary key
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_friendships_on_friend_id  (friend_id)
#  index_friendships_on_user_id    (user_id)
#

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  enum status: { pending: 0, accepted: 1, denied: 2, blocked: 3 }
end
