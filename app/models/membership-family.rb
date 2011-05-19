class Membership::Family < Member
  has_one :father, :class_name => :independent
  has_one :mother, :class_name => :independent
  has_many :dependents
end