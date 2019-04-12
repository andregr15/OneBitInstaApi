class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :description, :email

  attribute :photo_url do |user|
    if user.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_url(user.photo)
    end 
  end
  
  attribute :is_following do |user, params|
    params && user.followers.where(follower: params[:current_user]).exists?
  end

  attribute :followers_count do |user|
    user.followers.count
  end

  attribute :followings_count do |user|
    user.followeds.count
  end


  attribute :posts_count do |user|
    user.posts.count
  end
end
