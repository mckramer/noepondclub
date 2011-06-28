module TennisReservationsHelper

  def times
    times = Array.new
    time = 480
    11.times do
      time = time + 60
      times << [ "#{time_formatted(time)}", time ]
    end
    return times
  end
  def days
    days = Array.new
    day = Date.today - 1.day
    7.times do
      day = day + 1.day
      days << [ "#{Date::MONTHNAMES[day.month]} #{day.day}", day ]
    end
    return days
  end
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
end
