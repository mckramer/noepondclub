require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    puts "=== Populating database... ==="
    # Reset database
    Rake::Task['db:reset'].invoke
    # Populate database
    # >> Users
    make_members
    #make_employees
    # >> Independents & dependents
    make_independents
    make_dependents
    # >> Reservations
    make_reservations_tennis
    #make_reservations_paddle
    # >> Lessons
    # make_lessons_tennis
    # make_lessons_swimming
    puts "=== Done. Database populated. ==="
  end
end

def make_members
  100.times do |n|
    # Build common data
    email         = "member-#{n+1}@noepondclub.org"
    password      = "password!"
    name_last     = Faker::Name.last_name
    membership    = ["single", "family", "senior", "lifetime", "family_of_two", "junior", "paddle"].sample
    
    Member.create!(
      :badge                  => n+1,
      :membership             => membership,
      :password               => password,
      :password_confirmation  => password,
      :name                   => name
    )
  end
  puts "Members created."
end

def make_independents
  Member.all.each do |member|
    # Create 1st parent
    member.independents.create!(
      :name_first => Faker::Name.first_name,
      :name_middle => Faker::Name.first_name,
      :name_last => Faker::Name.last_name,
      :name_suffix => Faker::Name.suffix,
      :email => Faker::Internet.email("independent-#{member.id}-a"),
      :phone => Faker::PhoneNumber.phone_number
    )
    # Create 2nd parent
    member.independents.create!(
      :name_first => Faker::Name.first_name,
      :name_middle => Faker::Name.first_name,
      :name_last => Faker::Name.last_name,
      :name_suffix => Faker::Name.suffix,
      :email => Faker::Internet.email("independent-#{member.id}-b"),
      :phone => Faker::PhoneNumber.phone_number
    )
  end
end

def make_dependents
  Member.all.each do |member|
    (0..4).to_a.sample.times do
      dob = Date.civil(Date.today.year-rand(14), rand(12)+1, rand(28)+1)
      emblem_bluefrog       = Date.civil(dob.year + 4, rand(2)+6, rand(28)+1) if age(dob) > 4
      emblem_greenfish      = Date.civil(dob.year + 5, rand(2)+6, rand(28)+1) if age(dob) > 5
      emblem_goldfish       = Date.civil(dob.year + 6, rand(2)+6, rand(28)+1) if age(dob) > 6
      emblem_redshark       = Date.civil(dob.year + 7, rand(2)+6, rand(28)+1) if age(dob) > 7
      emblem_maroonshark    = Date.civil(dob.year + 7, rand(2)+6, rand(28)+1) if age(dob) > 8
      emblem_silverdolphin  = Date.civil(dob.year + 10, rand(2)+6, rand(28)+1) if age(dob) > 10 && rand(10) > 7
      emblem_goldendolphin  = Date.civil(dob.year + 11, rand(2)+6, rand(28)+1) if age(dob) > 11 && rand(10) > 5
      
      member.dependents.create!(
        :name_first => Faker::Name.first_name,
        :name_middle => Faker::Name.first_name,
        :name_last => Faker::Name.last_name,
        :email => Faker::Internet.email("dependent-#{member.id}"),
        :emblem_bluefrog => emblem_bluefrog,
        :emblem_greenfish => emblem_greenfish,
        :emblem_goldfish => emblem_goldfish,
        :emblem_redshark => emblem_redshark,
        :emblem_maroonshark => emblem_maroonshark,
        :emblem_silverdolphin => emblem_silverdolphin,
        :emblem_goldendolphin => emblem_goldendolphin
      )
    end
  end
end

def make_employees
  30.times do |n|
    email         = "employee-#{n+1}@noepondclub.org"
    password      = "password!"
    name          = Faker::Name.name
    positions     = ["lifeguard", "office", "head-lifeguard", "head-office", "asst-manager", "manager", "tennis"].sample(3)
    
    Employee.create!(
      :email                  => email,
      :password               => password,
      :password_confirmation  => password,
      :name                   => name,
      :position_ids           => positions
    )
  end
  puts "Employees created."
end

def make_positions
  names = ["lifeguard", "office", "head-lifeguard", "head-office", "asst-manager", "manager", "tennis-pro", "swim-coach", "diving-coach", "web-admin"]
  descriptions = [ "Can manage everything", "Can manage the study", "Can manage specific site", "Can manage specific division", "Can only manage their patients" ]
  (names.length).times do |n|
    name = names[n]
    description  = descriptions[n]
    Role.create!(
      :name           => name,
      :description    => description
    )
  end
  puts "Roles created."
end

def make_clubs
  clubs = ["Fish & Game", "Clearwater", "Crestview", "Berkley"]
  clubs.length.times do |n|
    Club.create!(
      :name => clubs[n],
      :address => "#{rand(200)} Main Street, Chatham, NJ 07928",
      :diving => rand(2).even?,
      :paddle => rand(2).even?,
      :swimming => rand(2).even?,
      :tennis => rand(2).even?
    )
  end
  puts "Clubs created."
end

def make_posts
  50.times do
    Post.create!(
      :title => Faker::Lorem.words,
      :body => Faker::Lorem.paragraphs(rand(3)+1)
      #:category => Category.all.sample
    )
  end
end

def make_events
  50.times do
    start_at  = DateTime.current
    end_at    = start_at + 1.day
    Event.create!(
      :title        => Faker::Lorem.words
      :start_at     => start_at
      :end_at       => end_at
      :allday       => rand(2).even?
      :where        => rand(2).even? ? "Noe Pond Club" : "#{Faker::Address.street_address} Chatham"
      :description  => Faker::Lorem.sentences
      #:category    => Category.all.sample
    )
  end
end

def age(dob = Date.today)
  age = Date.today.year - dob.year
  if Date.today < ( dob + age.years )
    return age - 1
  else 
    return age
  end
end