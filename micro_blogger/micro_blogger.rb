require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end


  def tweet(message)
    if message.length <= 140 
      @client.update(message)
    else
      puts "That tweet is too long, the tweet must be 140 characters or less."
    end
  end

  def dm(targ, message)
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if screen_names.include?(targ)
      puts "Trying to send #{targ} this direct message:"
      puts message
      message = "d @#{targ} #{message}"
      tweet(message)
    else
      puts "You can only dm people that are following you!"
    end
  end

  def followers_list
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
  end

  def everyones_last_tweet
    friends = @client.friends
    friends = friends.map { |friend| @client.user(friend) }
    friends.sort_by! { |friend| friend.screen_name.downcase }
    friends.each do |friend|
      timestamp = friend.status.created_at
      timestamp.strftime("%A %b %d")
      puts "#{friend.screen_name} POSTED THE FOLLOWING TWEET on #{timestamp}" 
      puts friend.status.text   
    end
  end

  def shorten(original_url)
    #shortening code
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    puts "Shortening this URL: #{original_url}"
    bitly.shorten(original_url).shorten
  end

  def spam_my_followers(message)
    screen_names = followers_list
    screen_names.each do |follower|
      puts "Trying to send #{follower} this direct message:"
      puts message
      message = "d @#{follower} #{message}"
      tweet(message)
    end
  end

  def run
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
        when 'q' then puts "Goodbye!"
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 't' then tweet(parts[1..-1].join(" "))
        when 'spam' then spam_my_followers(parts[1..-1].join(" "))
        when 'elt' then everyones_last_tweet
        when 's' then shorten(parts[1])
        when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1].to_s))
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end


blogger = MicroBlogger.new
blogger.run