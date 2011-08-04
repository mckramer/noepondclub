class Employee < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  serialize :roles

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :name_last, :name_first, :bio, :height, :weight,
                  :highschool, :college, :phone, :roles, :hometown, :twitter
  
  validates_presence_of :name_first, :name_last, :phone, :highschool, :roles
  
  public
  
  def self.positions_list
    return ['admin', 'manager', 'asst-manager', 'tester', 'swim-coach', 'dive-coach', 'head-lifeguard', 'asst-lifeguard', 'lifeguard', 'head-office', 'asst-office', 'office', 'instructor']
  end
  
  def position
    unless roles.nil?
      if roles.include?("admin") 
        return "Web Admin"
      elsif roles.include?("manager")
        return "Manager"
      elsif roles.include?("asst-manager")
        return "Asst. Manager"
      elsif roles.include?("tester")
        return "Tester"
      elsif roles.include?("swim-coach")
        return "Swim coach"
      elsif roles.include?("dive-coach")
        return "Dive coach"
      elsif roles.include?("head-lifeguard")
        return "Head Lifeguard"
      elsif roles.include?("asst-lifeguard")
        return "Asst. Head Lifeguard"
      elsif roles.include?("lifeguard")
        return "Lifeguard"
      elsif roles.include?("office") || roles.include?("asst-office") || roles.include?("head-office") 
        return "Office & CHG worker"
      end
    end
    return "Unknown"
  end
  
  def height_display
    return "#{height / 12}'#{height % 12}\""
  end
  
  def weight_display
    return "#{weight} lbs"
  end
  
  def name
    return "#{name_first} #{name_last}"
  end
  
  def reversed_name
    return "#{name_last}, #{name_first}"
  end
  
  def lifeguard?
    return roles.include?("lifeguard") || roles.include?("asst-lifeguard") || roles.include?("head-lifeguard")
  end
  
  def office?
    return roles.include?("office") || roles.include?("asst-office") || roles.include?("head-office")
  end
  
end
