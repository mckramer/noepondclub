class TennisReservation < ActiveRecord::Base
  belongs_to :member
  
  validates :member, :presence => true
  validates :court, :presence => true, :numericality => {:within => 1..10, :only_integer => true}
  validates :date, :presence => true
  validates :start_at, :presence => true, :numericality => {:within => 0..1440, :only_integer => true}
  validates :end_at, :presence => true, :numericality => {:within => 0..1440, :only_integer => true}
  validates_uniqueness_of :court, :scope => [:date, :start_at, :end_at]
  
  validate :uniqueness_of_reservation
  validate :end_is_greater_than_start
  validate :length_of_reservation
  
  attr_accessor :length
  attr_accessible :date, :start_at, :end_at, :court, :length
  
  # 1. :start_at must be less than :end_at
  # 2. for non-admins, :end_at must be 2 hours at most larger than :start_at
  # 3. start_at and end_at of new reservation must be both smaller or both larger than previous entries
  # >  get Reservation.where(:date == date).each do { check step 3 here } end
  
  # for view
  # Have user first select date, then fill in other fields
  # User can select start time and then duration of time
  # 
  
  public
  
  def surface(court = self.court)
    if court == 5 || court == 6
      return "Turf"
    else 
      return "Har-Tru"
    end
  end
  
  def start_at_text
    time_formatted(self.start_at)
  end
  
  def end_at_text
    time_formatted(self.end_at + 1)
  end
  
  def date_text
    if Date.today.year == date.year
      return "#{Date::MONTHNAMES[date.mon]} #{date.mday}"
    else
      return "#{Date::MONTHNAMES[date.mon]} #{date.mday}, #{date.year}"
    end
  end
  
  private
  
  MIN_LENGTH = 30
  MAX_LENGTH = 60
  
  def time_formatted(time)
    hours = time / 60
    minutes = time - (hours * 60)
    if hours < 12
      return "#{hours}:#{0 if minutes < 10}#{minutes} am"
    elsif hours == 12
      return "12:00 pm"
    else
      return "#{hours-12}:#{0 if minutes < 10}#{minutes} pm"
    end
  end
  
  def uniqueness_of_reservation
    errors.add(:start_at, "is not available (another reservation overlaps)") unless TennisReservation.where("? == date AND ? == court AND ? >= start_at AND ? <= end_at", date, court, start_at, start_at).count == 0
    errors.add(:end_at, "is not available (reservation overlaps onto another; try shortening it)") unless TennisReservation.where("? == date AND ? == court AND ? >= start_at AND ? <= end_at", date, court, end_at, end_at).count == 0
    errors.add_to_base("Reservation overlaps another; try shortening it") unless TennisReservation.where("? == date AND ? == court AND ? <= start_at AND ? >= end_at", date, court, start_at, end_at).count == 0
  end
  
  def end_is_greater_than_start
    errors.add_to_base("The start time must be smaller than the end time") unless start_at < end_at
  end
  
  def length_of_reservation
    errors.add(:length, "is too long; you must ") if length.to_i > MAX_LENGTH
    errors.add(:length, "is too short; you must at least reserve the court for 30 minutes") if length.to_i < MIN_LENGTH
  end
end
