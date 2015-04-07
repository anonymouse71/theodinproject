require 'jumpstart_auth'

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
    command = ''
    while command != 'q'
      printf "Enter command:> "
      input = gets.chomp
      parts = input.split
      command = parts[0]

      case command
      when 'q' then puts "Goodbye"
      when 't' then tweet parts[1..-1].join(" ")
      when 'dm' then dm parts[1], parts[2..-1].join(" ")
      when 'sf' then spam_my_followers parts[1..-1].join(" ")
      when 'latest' then everyones_latest_tweet
      else puts "Sorry '#{command}' is not a valid command!"
      end
    end
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
    friends = @client.friends.sort_by {|friend| friend.screen_name.downcase}

    friends.each do |friend|
      timestamp = friend.status.created_at
      time_string = timestamp.strftime("%A, %b %d")
      status = friend.status.text

      puts "#{friend.screen_name} said this on #{time_string}..."
      puts status
      puts "" #blank line to separate people
    end
  end

end

microblog = MicroBlogger.new
#microblog.tweet "MicroBlogger has been initialized. This message has been sent via JumpStarts' API."
microblog.run
