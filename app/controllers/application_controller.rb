class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_tweets
  before_filter :get_weather
  before_filter :get_classes
  
  private
  
  def get_tweets
    @npc_tweets ||= Twitter::Search.new.from("NoePondClub").per_page(3).fetch
    @mention_tweets ||= Twitter::Search.new.mentioning("NoePondClub").per_page(3).fetch
    
    # Handle lack of new tweets
    @no_tweets = true if @npc_tweets.empty? && @mention_tweets.empty?
    # Handle problems with Twitter
    rescue Twitter::ServiceUnavailable, Errno::ETIMEDOUT then @no_tweets = true
  end
  
  def get_weather
    client ||= YahooWeather::Client.new
    @weather ||= client.lookup_by_woeid(12760949)
    thunderstorms = [3, 4, 37, 38, 39, 45, 47]
    if thunderstorms.include?(@weather.forecasts[0].code) || thunderstorms.include?(@weather.condition.code)
      @weather_warning = :thunderstorms
    end
    
    rescue RunTimeError
  end
  
  def get_classes
    @body_classes = params.values_at(:controller, :action)
    @body_classes << "weather-#{@weather.condition.code}" unless @weather.nil?
  end

end