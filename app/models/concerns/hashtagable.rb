module Hashtagable
  extend ActiveSupport::Concern

  included do
    after_save :map_hashtags!
  end


  class_methods do
    attr_reader :field_to_search

    def hashtags_on(field)
      @field_to_search = field
    end
  end


  private


  def map_hashtags!
    raise "Method 'hashtags_on' should be used" unless self.class.field_to_search.present?
    service = HashtagMappingService.new(self, self.class.field_to_search)
    service.call
  end
end
