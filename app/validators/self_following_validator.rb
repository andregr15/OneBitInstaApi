class SelfFollowingValidator < ActiveModel::Validator
  def validate(record)
    if record[:followed_id] == record[:follower_id]
      record.errors.add(:base, "It's not possible to perform self following")
    end
  end
end
