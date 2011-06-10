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
      :name_first             => name_first,
      :name_last              => name_last,
      :name_middle            => name_middle,
      :name_suffix            => name_suffix
    )
  end
  puts "Members created."
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

def make_allergens
  names = [ "Peanuts", "Tree nuts", "Soy", "Water", "Wheat", "Shellfish", "Latex", "Milk", "Eggs", "MSG" ]
  (names.length).times do |n|
    name = names[n]
    description = Faker::Lorem.paragraph
    Allergen.create!(
      :name       => name,
      :abbr       => name,
      :description => description
    )
  end
  puts "Allergens created."
end

def make_allergies
  make_count = (0..3).to_a
  Participant.all.each do |participant|
    make_count.sample.times do
      allergen = Allergen.find :first, :offset => ( Allergen.count * rand ).to_i
      # No !.  Will skip if doesn't validate
      Allergy.create(
        :allergen_id => allergen.id,
        :user_id => participant.id
      )
    end
  end
  puts "Allergies created."
end

def make_drugs
  drugs = ['Albuterol', 'Alendronate', 'Amitriptyline', 'Amoxicillin', 'Atenolol', 'Baclofen', 'Benazepril', 'Bumetanide', 'Buspirone', 'Cephalexin', 'Chlorpropamide', 'Cimetidine', 'Ciprofloxacin', 'Citalopram', 'Clonidine', 'Cyclobenzaprine', 'Dexamethasone', 'Diclofenac', 'Dicyclomine', 'Diltiazem', 'Doxazosin', 'Doxepin Hcl', 'Doxycycline Hyclate', 'Enalapril', 'Estradiol', 'Estropipate', 'Famotidine', 'Fluocinonide', 'Fluoxetine', 'Folic Acid', 'Furosemide', 'Gentamicin', 'Glimepiride', 'Glipizide', 'Glyburide', 'Haloperidol', 'Hydralazine', 'Hydrochlorothiazide', 'Hydrocortisone', 'Ibuprofen', 'Indapamide', 'Isoniazid', 'Lactulose', 'Levothyroxine', 'Loratadine', 'Lovastatin', 'Magnesium Oxide', 'Medroxyprogesterone', 'Megestrol', 'Meloxicam', 'Metformin', 'Methyldopa', 'Methylprednisolone', 'Naproxen', 'Nortriptyline', 'Nystatin', 'Oxybutynin', 'Penicillin', 'Phenazopyridine', 'Pilocarpine', 'Potassium Chloride', 'Pravastatin', 'Prednisone', 'Prochlorperazine', 'Promethazine', 'Ranitidine', 'Spironolactone']
  50.times do |n|
    name          = drugs[n]
    description   = Faker::Lorem.paragraph
    Drug.create!(
      :name         => name,
      :description  => description
    )
  end
  #Drug.limit(10).each do |drug, n|
  #  parent = Drug.find_by_id(n + 15)
  #  drug.update!
  #end
  puts "Drugs created."
end

def make_indications
  # should complete "drug is used to ___", such as drug is used to lower blood pressure
  verbs = ['lower', 'raise', 'strengthen', 'weaken', 'improve', 'protect', 'reduce', 'relieve']
  nouns = ['blood pressure', 'cholesterol', 'the immune system', 'the number of white blood cells', 'minor aches and pains', 'minor inflammation', 'minor fever']
  make_count = (1..3).to_a
  Drug.all.each do |drug|
    make_count.sample.times do
      text = verbs[rand(verbs.length)] + ' ' + nouns[rand(nouns.length)]
      Indication.create!(
        :text         => text,
        :description  => Faker::Lorem.paragraph,
        :drug_id      => drug.id
      )
    end
  end
  puts "Indications created."
end

def make_dosages
  units_list = ['mg', 'mL', 'oz']
  frequencies = [1, 2, 4, 6, 8, 12, 24, 56, 84, 168]
  forms = ['tablet', 'capsule', 'liquid', 'gel', 'cream']
  routes = ['oral', 'nasal', 'Intraveneous (IV)', 'Intramusculer (IM)', 'topical']
  make_count = (1..3).to_a
  Drug.all.each do |drug|
    make_count.sample.times do
      units = units_list.choice
      strength = rand(290) + 10
      dose = (rand(3) + 1) * strength
      frequency = frequencies.sample
      form = forms.sample
      route = routes.sample
      Dosage.create!(
        :units => units,
        :strength => strength,
        :dose => dose,
        :frequency => frequency,
        :form => form,
        :route => route,
        :drug_id => drug.id
      )
    end
  end
  puts "Dosages created."
end

def make_prescriptions
  make_count = (0..3).to_a
  Participant.all.each do |participant|
    make_count.sample.times do
      drug = Drug.find :first, :offset => ( Drug.count * rand ).to_i
      indication = drug.indications.sample
      dosage = drug.dosages.sample
      prescribed_at = rand(5.days).ago
      archived_at = rand(100).even? ? Time.now : nil 
      # No !.  Will skip if doesn't validate
      Prescription.create(
        :drug_id        => drug.id,
        :indication_id  => indication.id,
        :dosage_id      => dosage.id,
        :user_id        => participant.id,
        :prescribed_at  => prescribed_at,
        :archived_at    => archived_at,
        :note           => Faker::Lorem.paragraph
      )
    end
  end
  puts "Prescriptions created."
end

private
def random_roles
  role_ids = Array.new
  Role.all do |role|
    if role.name.lowercase == "health provider"
      role_ids[] = role.id
      return role_ids
    end
  end
end