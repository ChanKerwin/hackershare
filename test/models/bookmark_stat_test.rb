# frozen_string_literal: true

# == Schema Information
#
# Table name: bookmark_stats
#
#  id           :bigint           not null, primary key
#  clicks_count :integer          default(0)
#  date_type    :string           default("daily")
#  dups_count   :integer          default(0)
#  likes_count  :integer          default(0)
#  score        :integer
#  bookmark_id  :bigint
#  date_id      :date
#
# Indexes
#
#  index_bookmark_stats_on_bookmark_id                            (bookmark_id)
#  index_bookmark_stats_on_date_id_and_date_type_and_bookmark_id  (date_id,date_type,bookmark_id) UNIQUE
#  index_bookmark_stats_on_date_id_and_date_type_and_score        (date_id,date_type,score)
#
require "test_helper"

class BookmarkStatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
