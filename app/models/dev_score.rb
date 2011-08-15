`class Score < ActiveRecord::Base
  
  belongs_to :scoreable, :polymorphic => true
  
  #> type = {tennis, swimming}
  #> home_score & away_score ==== strings so can handle tennis matches
  #> home_entity & away_entity
  ##> Rival, Independent, Dependent
  
  public
  
  # Getter to return home team / player
  # > Returns home object if specified
  # > Returns Noe if nil
  def home
    if home.blank?
      {:id => 0, :name => "Noe Pond Club", :address => "395 Southern Blvd, Chatham, NJ"}
    else
      home
  end
  
  # Getter to return home team / player
  # > Returns home object if specified
  # > Returns Noe if nil
  def away
    if away.blank?
      {:id => 0, :name => "Noe Pond Club", :address => "395 Southern Blvd, Chatham, NJ"}
    else
      away
  end
  
  # Check to see if the home team/player won the match/game/meet
  # > Returns true if home team won
  # > Returns false otherwise
  def home_won?
    home_score > away_score
  end
  
  # Check to see if the away team/player won the match/game/meet
  # > Returns true if away team won
  # > Returns false otherwise
  def away_won?
    home_score < away_score
  end
  
  # Check to see if the match/game/meet was a tie
  # > Returns true if a tie
  # > Returns false otherwise
  def tie?
    home_score == away_score
  end
  
  #
  # > Returns symbol representing the outcome of the game
  # > :home if the home team won
  # > :away if the away team won
  # > :tie if the game ended as a tie
  def victor
    if home_score.to_i > away_score.to_i
      :home
    elsif home_score.to_i < away_score.to_i
      :away
    else
      :tie
    end
  end
 
end
`