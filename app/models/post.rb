class Post < ActiveRecord::Base
  acts_as_commentable
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
