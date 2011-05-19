Noepond::Application.routes.draw do
  
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
  devise_for :members, :path => 'accounts'
  resources :members do
    resources :dependents
    # resources :tennis_reservations
    # > member, court, date, start_time, end_time
    # resources :paddle_reservations
    # resources :tennis_lessons
    # > member, instructor, date & time
    # resources :swimming_lessons
    # > member_id, member_name(s) (dependent or adult), instructor_id, type = { private, group, semi-private }, date, time, emblem, completed, reviewed, paid, comments
  end
  
  # Employees
  # > type = { lifeguard, office, manager, maintainance, tennis, paddle, camp }, date_started
  # devise_for :employees, :path => 'workers'
  # resources :employees do
  # 
  # end
  
  # Static pages
  match 'about' => 'page#about'
  match 'about/family' => 'page#family'
  match 'about/history' => 'page#history'
  match 'contact' => 'page#contact'
  match 'directions' => 'page#directions'
  match 'employment' => 'page#employment'
  match 'prospective' => 'page#prospective'
  
  # Application root
  root :to => "page#home"

end
