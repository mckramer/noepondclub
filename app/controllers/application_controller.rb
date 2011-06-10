class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_tweets
  before_filter :get_weather
  before_filter :get_classes
  
  private
  def get_tweets
    @npc_tweets = Twitter::Search.new.from("NoePondClub").per_page(3).fetch
    @mention_tweets = Twitter::Search.new.mentioning("NoePondClub").per_page(3).fetch
  end
  
  def get_weather
    @weather = YahooWeather::Client.new.lookup_by_woeid(12760949)
    if [3, 4, 37, 38, 39, 45].include?(@weather.condition.code)
      @weather_warning = :thunderstorms
    else
      @weather_warning = :test
    end
  end
  
  def get_classes
    @body_classes = params.values_at(:controller, :action)
    @body_classes << "weather-#{@weather.condition.code}" if @weather.nil? == false
  end
  
  
end
