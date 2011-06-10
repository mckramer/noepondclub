class Dependent < ActiveRecord::Base
  
  belongs_to :member
  
  attr_accessible :name_first, :name_middle, :name_last, :dob
  
  def current_age
    age = Date.today.year - self.dob.year
    if Date.today < ( self.dob + age.years )
      return age - 1
    else 
      return age
    end
  end
  
  def current_badge
    if self.emblem_goldendolphin.empty?
      if self.emblem_silverdolphin.empty?
        if self.emblem_maroonshark.empty?
          if self.emblem_redshark.empty?
            if self.emblem_goldfish.empty?
              if self.emblem_greenfish.empty?
                if self.emblem_bluefrog.empty?
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
