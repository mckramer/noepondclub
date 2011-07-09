Noepond::Application.routes.draw do
  
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'
  # > comment, authorable (member or employee)
  resources :posts
  # > title, body, authorable (member or employee), category
  # resources :events
  # > title, start_at, end_at, notes, category = {swim-team, tennis-team, dive-team, watershow, tennis, paddle, camp}
    
  # Members
  devise_for :members, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
  resources :members do
    resources :independents
    resources :dependents
    resources :tennis_reservations, :path => 'reservations/tennis', :only => [:index, :new, :create, :show, :destroy]
    # > member, court, date, start_at, end_at
    # resources :paddle_reservations, :path => 'reservations/paddle', :only => [:index, :new, :create, :show, :destroy]
    # > 
    # resources :tennis_lessons, :path => 'lessons/tennis'
    # > member, instructor, date & time
    # resources :swimming_lessons, :path => 'lessons/swimming'
    # > member_id, member_name(s) (dependent or adult), instructor_id, type = { private, group, semi-private }, date, time, emblem, completed, reviewed, paid, comments
  end
  
  match 'employees/profile' => "employees#profile"
  
  # Employees
  # > roles = { lifeguard, office, manager, asst-manager, maintainance, tennis, paddle, camp, admin }
  # > phone, cell, bio, height, weight, hometown, highschool, college, start_at, end_at
  devise_for :employees, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
  resources :employees do
  
  end
  
  # Static pages
  match 'about' => 'page#about'
  match 'about/family' => 'page#family'
  match 'about/history' => 'page#history'
  match 'contact' => 'page#contact'
  match 'current' => 'page#current'
  match 'directions' => 'page#directions'
  match 'employment' => 'page#employment'
  
  match 'prospective' => 'page#prospective'
  match 'prospective/emblems' => 'page#prospective-emblems'
  match 'prospective/events' => 'page#prospective-events'
  match 'prospective/paddle' => 'page#prospective-paddle'
  # match 'prospective/tennis' => 'page#prospective-tennis'
  match 'prospective/winter' => 'page#prospective-winter'
  match 'prospective/teams/diving' => 'page#prospective-teams-diving'
  match 'prospective/teams/paddle' => 'page#prospective-teams-paddle'
  match 'prospective/teams/swimming' => 'page#prospective-teams-swimming'
  match 'prospective/teams/tennis' => 'page#prospective-teams-tennis'
  match 'prospective/teams/watershow' => 'page#prospective-teams-watershow'
  
  # match 'teams/diving' => 'page#teams-diving'
  # match 'teams/paddle' => 'page#teams-paddle'
  match 'teams/swimming' => 'page#teams_swimming'
  # match 'teams/tennis' => 'page#teams-tennis'
  # match 'teams/watershow' => 'page#teams-watershow'
  
  # Application root
  root :to => "page#home"

end
