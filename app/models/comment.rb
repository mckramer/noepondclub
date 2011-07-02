class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :authorable, :polymorphic => true

  default_scope :order => 'created_at ASC'
end
