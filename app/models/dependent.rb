class Dependent < ActiveRecord::Base
  
  belongs_to :member
  
  attr_accessor :start_emblem
  attr_accessible :name_first, :name_middle, :name_last, :dob
  
  def name
    return "#{name_first}"
  end
  
  def age
    age = Date.today.year - self.dob.year
    if Date.today < ( self.dob + age.years )
      return age - 1
    else 
      return age
    end
  end
  
  def emblem
    if emblem_goldendolphin.blank?
      if emblem_silverdolphin.blank?
        if emblem_maroonshark.blank?
          if emblem_redshark.blank?
            if emblem_goldfish.blank?
              if emblem_greenfish.blank?
                if emblem_bluefrog.blank?
                  return "Red frog"
                else
                  return "Blue frog"
                end
              else
                return "Green fish"
              end
            else
              return "Gold fish"
            end
          else
            return "Red shark"
          end
        else
          return "Maroon shark"
        end
      else
        return "Silver dolphin"
      end
    else
      return "Golden dolphin"
    end
  end
  
  def current_badge_img
    return current_badge.lowercase.tr!(' ', '_')
  end
  
end
