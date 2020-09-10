# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id                  :bigint           not null, primary key
#  bookmarks_count     :integer          default(0)
#  name                :string
#  subscriptions_count :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint
#
# Indexes
#
#  index_tags_on_bookmarks_count  (bookmarks_count)
#  index_tags_on_user_id          (user_id)
#
class Tag < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :taggings
  has_many :bookmarks, through: :taggings

  has_many :tag_subscriptions
  has_many :followers, through: :tag_subscriptions, source: "user"

  validates :name, uniqueness: true

  def self.list_names(limit)
    Tag.order(bookmarks_count: :desc).limit(limit).map(&:name).join(",")
  end
end
