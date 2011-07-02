Noepond::Application.routes.draw do
  
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'
  resources :posts
    
  # Data
  # > Swim lessons
  # > Camp
  
  # Members
  devise_for :members, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
  resources :members do
    resources :independents
    resources :dependents
    resources :tennis_reservations, :path => 'reservations/tennis', :only => [:index, :new, :create, :show, :destroy]
    # > member, court, date, start_at, end_at
    # resources :paddle_reservations
    # resources :tennis_lessons
    # > member, instructor, date & time
    # resources :swimming_lessons
    # > member_id, member_name(s) (dependent or adult), instructor_id, type = { private, group, semi-private }, date, time, emblem, completed, reviewed, paid, comments
  end
  
  # Employees
  # > type = { lifeguard, office, manager, maintainance, tennis, paddle, camp }, start_at, end_at
  # devise_for :employees, :path => 'staff'
  # resources :employees do
  #   resources :bio
  #   > hometown, highschool, college
  # end
  
  # Static pages
  match 'about' => 'page#about'
  match 'about/family' => 'page#family'
  match 'about/history' => 'page#history'
  match 'contact' => 'page#contact'
  match 'current' => 'page#current'
  match 'directions' => 'page#directions'
  match 'employment' => 'page#employment'
  match 'prospective' => 'page#prospective'
  match 'prospective/events' => 'page#prospective-events'
  match 'prospective/paddle' => 'page#prospective-paddle'
  match 'prospective/winter' => 'page#prospective-winter'
  match 'prospective/emblems' => 'page#prospective-emblems'
  match 'prospective/teams/swimming' => 'page#prospective-teams-swimming'
  match 'prospective/teams/diving' => 'page#prospective-teams-diving'
  match 'prospective/teams/tennis' => 'page#prospective-teams-tennis'
  match 'prospective/teams/watershow' => 'page#prospective-teams-watershow'
  match 'prospective/teams/paddle' => 'page#prospective-teams-paddle'
  
  # Application root
  root :to => "page#home"

end
