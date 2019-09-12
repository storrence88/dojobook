# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  description            :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :friends, -> { where friendships: { status: accepted } }, through: :friendships
  has_many :requested_friends, -> { where friendships: { status: requested } }, through: :friendships, source: :friend
  has_many :pending_friends, -> { where friendships: { status: pending } }, through: :friendships, source: :friend
  has_many :blocked_friends, -> { where friendships: { status: blocked } }, through: :friendships, source: :friend

  validates :first_name, :last_name, :description, presence: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def friend_request(friend)
    return if self == friend || Friendship.where(user: self, friend: friend).exists?

    transaction do
      Friendship.create(user: self, friend: friend, status: :pending)
      Friendship.create(user: friend, friend: self, status: :requested)
    end
  end

  def accept_request(friend)
    transaction do
      Friendship.find_by(user: self, friend: friend, status: [:requested])&.accepted!
      Friendship.find_by(user: friend, friend: self, status: [:pending])&.accepted!
    end
  end

  def reject_request(friend)
    transaction do
      Friendship.find_by(user: self, friend: friend)&.destroy!
      Friendship.find_by(user: friend, friend: self)&.destroy!
    end
  end

  def has_friendship?(friend)
    return true if self == friend

    friendships.map(&:friend_id).include?(friend.id)
  end

  def requested_friends_with?(friend)
    return false if self == friend

    requested_friends.map(&:id).include?(friend.id)
  end

  def pending_friends_with?(friend)
    return false if self == friend

    pending_friends.map(&:id).include?(friend.id)
  end

  def friends_with?(friend)
    return false if self == friend

    friends.map(&:id).include?(friend.id)
  end
end
