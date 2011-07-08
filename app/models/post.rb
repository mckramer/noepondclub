class Post < ActiveRecord::Base
  acts_as_commentable
  belongs_to :authorable, :polymorphic => true
  default_scope :order => 'id DESC'
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  def self.category_list
    return ['general', 'swimming', 'swim-team', 'tennis', 'tennis-team']
  end
end
