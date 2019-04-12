class HashtagMappingService
  def initialize(resource, field_name)
    @resource = resource
    @field_value = resource[field_name]
  end


  def call
    mapped_hashtags = map_hashtags_to_resource
    remove_old_mappings(mapped_hashtags)
  end


  private


  def map_hashtags_to_resource
    hashtag_regex.map do |item|
      hashtag = Hashtag.find_or_create_by(name: item[0])
      hashtag.mappings.find_or_create_by(hashtagable: @resource)
      hashtag
    end
  end


  def remove_old_mappings(mapped_hashtags)
    @resource.hashtag_mappings.where.not(hashtag_id: mapped_hashtags).delete_all
  end


  def hashtag_regex
    @field_value.scan /(?:^|\s)#(\w+)/i
  end
end
