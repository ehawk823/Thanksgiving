class Handle
  include Mongoid::Document
  field :handle_name, type: String

  def client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
      config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
      config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
  end

  def tweets
    self.client
    @client.user_timeline(self.handle_name)
  end

  def characters
    @characters = 0
    @tweets = self.tweets
    @tweets[1..20].each do |tweet|
      @characters += tweet.text.length
    end
    @characters
  end

  def retweets
    @retweets = 0
    @tweets = self.tweets
    @tweets[1..20].each do |tweet|
      @retweets += tweet.retweet_count
    end
    @retweets
  end

  def uris
    @uris = 0
    @tweets = self.tweets
    @tweets[1..20].each do |tweet|
      if tweet.uris?
        @uris += 1
      end
    end
    @uris
  end

end
