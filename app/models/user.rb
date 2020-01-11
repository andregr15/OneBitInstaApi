# frozen_string_literal: true

class User < ActiveRecord::Base
  acts_as_token_authenticatable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :likes
  has_many :followeds, class_name: "Following", foreign_key: "follower_id"
  has_many :followers, class_name: "Following", foreign_key: "followed_id"

  attr_accessor :photo_base64
  has_one_attached :photo
  before_validation :set_base64_photo

  validates :name, presence: true

  def set_base64_photo
    return if self.photo_base64.nil?
    filename = Time.zone.now.to_s + '.jpg'
    FileUtils.mkdir_p "#{Rails.root}/tmp/images"
    File.open("#{Rails.root}/tmp/images/#{filename}", 'wb') do |f|
      f.write Base64.decode64(self.photo_base64)
    end
    self.photo.attach(io: File.open("#{Rails.root}/tmp/images/#{filename}"), filename: filename)
    FileUtils.rm("#{Rails.root}/tmp/images/#{filename}")
  end

end
