class TennisReservation < ActiveRecord::Base
  belongs_to :member
  
  validates :number, :presence => true, :numericality => {:within => 0..10, :only_integer => true}
  validates :date, :presence => true
  validates :start_at, :presence => true, :numericality => {:within => 0..1440, :only_integer => true}
  validates :end_at, :presence => true, :numericality => {:greater_than => :start_at, :less_than => 1440, :only_integer => true}
  
  def surface
    if self.number == 5 || self.number == 6
      return "Turf"
    else 
      return "Har-Tru"
    end
  end
  
  def start_at_text
    hours = self.start_at / 60
    minutes = self.start_at - (hours * 60)
    minutes = ("0" + minutes) if minutes < 10
    if hours > 12
      return "#{hours}:#{minutes} am"
    else
      return "#{hours-12}:#{minutes} pm"
    end
  end
end
