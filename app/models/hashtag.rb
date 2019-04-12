class Hashtag < ApplicationRecord
  has_many :mappings, class_name: "HashtagMapping", dependent: :delete_all
  validates :name, presence: true, uniqueness: true
end
