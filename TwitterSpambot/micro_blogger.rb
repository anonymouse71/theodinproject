require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing..."
    @client = JumpstartAuth.twitter
  end

  def tweet message
    if message.size <= 140
      @client.update message
      puts "message has been posted!"
    else
      puts "error: invalid message!"
    end
  end

  def dm target, message
    puts "Trying to send a message to #{target}!"
    if follower_list.include? target
      new_message = "@#{target} #{message}"
      tweet new_message
    else
      puts "Sorry you can only 'dm' people who follow you"
    end
  end

  def run
    puts "Welcome to the JSL Twitter Client!"
    puts "*"*50
    puts "Type 'menu' for a list of all available commands"
    command = ''
    while command != 'q'
      printf "Enter command:> "
      input = gets.chomp
      parts = input.split
      command = parts[0]

      case command
      when 'menu' then print_menu
      when 'q' then puts "Goodbye"
      when 't' then tweet parts[1..-1].join(" ")
      when 'dm' then dm parts[1], parts[2..-1].join(" ")
      when 'sf' then spam_my_followers parts[1..-1].join(" ")
      when 'latest' then everyones_latest_tweet
      when 'surl' then shorten parts[1]
      when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
      else puts "Sorry '#{command}' is not a valid command!"
      end
    end
  end

  def print_menu
    puts "Menu Commands!"
    puts "-"*50
    puts "q - quit"
    puts "t (message) - sends a tweet with whatever message you like."
    puts "dm (person) (message) - sends a direct message to a person."
    puts "sf (message) - spams all your followers with message."
    puts "latest - shows everyones recent tweets"
    puts "surl - shorten a url"
    puts "turl - Tweet a message + url, and bitly will shorten it"
    puts "-"*50
  end

  def follower_list
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    screen_names[0..9] #Grabs first 10 names
  end

  def spam_my_followers message
    p message
    follower_list.each {|follower| dm(follower, message)}
    puts "Messages have been sent to your followers!"
  end

  def everyones_latest_tweet
    friends = []
    @client.followers.each {|follower| friends.push(@client.user(follower))}

    friends.each do |friend|
      timestamp = friend.status.created_at
      time_string = timestamp.strftime("%A, %b %d")
      status = friend.status.text

      puts "#{friend.screen_name} said this on #{time_string}..."
      puts status
      puts "" #blank line to separate people
    end
  end

  def shorten original_url
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    puts "Shortening this URL: #{original_url}"
    bitly.shorten(original_url).short_url
  end

end

microblog = MicroBlogger.new
microblog.run
