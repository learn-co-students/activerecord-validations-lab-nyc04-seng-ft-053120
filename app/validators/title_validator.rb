class TitleValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value =~ /^true facts$/i
      record.errors[attribute] << (options[:message] || "click bait")
    end
  end
  
end
