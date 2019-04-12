class HashtagMapping < ApplicationRecord
  belongs_to :hashtag
  belongs_to :hashtagable, polymorphic: true

  validates :hashtag_id, uniqueness: { scope: :hashtagable, message: "can't be present twice at same resource" }
end
