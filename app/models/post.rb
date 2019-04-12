class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :delete_all
  has_many :hashtag_mappings, as: :hashtagable
  has_many :hashtags, through: :hashtag_mappings
  
  attr_accessor :photo_base64
  has_one_attached :photo
  before_validation :set_base64_photo  

  validates :photo, file_presence: true
  validates :description, presence: true

  include Hashtagable
  hashtags_on :description
  
  
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
