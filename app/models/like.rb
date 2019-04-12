class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :user, uniqueness: { scope: :likeable, message: "can't like a thing twice" }
end
