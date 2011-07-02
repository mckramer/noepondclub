class Post < ActiveRecord::Base
  acts_as_commentable
  belongs_to :authorable, :polymorphic => true
  default_scope :order => 'id DESC'
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
