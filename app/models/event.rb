class Event < ActiveRecord::Base
  acts_as_commentable
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  def self.category_list
    return ['general', 'swim-team', 'tennis-team', 'dive-team', 'watershow', 'tennis', 'paddle', 'camp']
  end
  
  def date
    start_at.to_date
  end
  
  def time
    if allday?
      return "All day"
    elsif start_at.to_date == end_at.to_date
      return "#{start_at.strftime("%I:%M %p")} - #{end_at.strftime("%I:%M %p")}"
    else
      return "#{start_at.to_time} - next day"
    end
  end
end
