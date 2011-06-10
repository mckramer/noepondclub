class Member < ActiveRecord::Base

  has_many :independents
  has_many :dependents
  has_many :tennis_reservations
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :badge, :membership
  
  # Validations
  # validates_presence_of :email, :password
  
  validates_uniqueness_of :badge
  
  def self.membership_types
    return ['family', 'single', 'senior', 'lifetime']
  end
  
end
