Noepond::Application.routes.draw do
  
  resources :posts
  
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'

  # Data
  # > Tennis
  # resources :tennis_courts
  # >> number, surface (hard-code), open_time, close_time
  # > Paddle
  # resources :paddle_courts
  # >> number, open_time, close_time
  # > Swim lessons
  # > Camp
  
  # Members
  devise_for :members, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
  resources :members do
    resources :independents
    resources :dependents
    resources :tennis_reservations, :path => 'reservations/tennis'
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
  
  # Application root
  root :to => "page#home"

end
