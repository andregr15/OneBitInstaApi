class FilePresenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    @record = record
    @value = value
    @attribute = attribute
    validate!
  end


  private


  def validate!
    unless @value.attached?
      @record.errors.add(@attribute, :empty)
    end
  end
end
