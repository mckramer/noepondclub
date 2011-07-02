class Independent < ActiveRecord::Base
  belongs_to :member
  
  attr_accessor :phone_areacode, :phone_exchange, :phone_subscriber
  attr_accessible :name_first, :name_last, :name_suffix, :email
  
  def name
    return "#{name_first} #{name_last}#{", " unless name_suffix.blank?}#{name_suffix}"
  end
end
