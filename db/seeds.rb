# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "Seeding database..."
# Create super administator
make_admin
puts "Completed seed."
# Done

private
def make_admin
  email         = "admin@noepondclub.org"
  # TODO: autogenerate password
  password      = "superpassword!"
  name          = "Administrator"
  positions     = ["super"]
    
  Employee.create!(
    :email                  => email,
    :password               => password,
    :password_confirmation  => password,
    :name                   => name,
    :positions              => positions
  )
  puts "Super administrator created with password = \"#{password}\" (minus the quotes)."
  # Pay attention to this output for password
end

def make_clubs
  puts "Creating clubs..."
  Club.create!(
    :name       => "Noe Pond Club",
    :address    => "395 Southern Blvd, Chatham, NJ 07928",
    #:email     => "http://www.noepondclub.org",
    :diving     => true,
    :paddle     => true,
    :swimming   => true,
    :tennis     => true
  )
  puts "Clubs created."
end