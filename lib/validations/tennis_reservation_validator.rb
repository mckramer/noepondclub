class TennisReservationValidator < ActiveModel::EachValidator  
  def validate
    if options[:fields].any?{|field| record.send(field) == "Evil" }
      record.errors[:base] << "This person is evil"
    end
  end
end  