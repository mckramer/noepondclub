class Employee < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  serialize :roles

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :name_last, :name_first, :bio, :height, :weight,
                  :highschool, :college, :phone, :roles
  
  validates_presence_of :name_first, :name_last, :phone, :highschool, :roles
  
  public
  
  def self.positions_list
    return ['admin', 'head', 'asst', 'manager', 'lifeguard', 'office']
  end
  
  def position
    unless roles.nil?
      if roles.include?("admin") 
        return "Web Admin"
      elsif roles.include?("manager")
        if roles.include?("asst")
          return "Asst. Manager"
        else
          return "Manager"
        end
      elsif roles.include?("tester")
        return "Tester"
      elsif roles.include?("swim-coach")
        return "Swim coach"
      elsif roles.include?("lifeguard")
        if roles.include?("head")
          return "Head Lifeguard"
        elsif roles.include?("asst")
          return "Asst. Head Lifeguard"
        else
          return "Lifeguard"
        end
      elsif roles.include?("office")
        return "Office & CHG personnel"
      end
    end
    return "Unknown"
  end
  
  def height_display
    return "#{height / 12}' #{height % 12}\""
  end
  
  def name
    return "#{name_first} #{name_last}"
  end
  
  def reversed_name
    return "#{name_last}, #{name_first}"
  end
  
end
