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

  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ''
    while command != 'q'
      printf "Enter command:> "
      input = gets.chomp.split
      command = input.shift
      message = input.join(" ")

      case command
      when 'q' then puts "Goodbye"
      when 't'
        p message
      else puts "Sorry '#{command}' is not a valid command!"
      end
    end
  end
end

  microblog = MicroBlogger.new
  #microblog.tweet "MicroBlogger has been initialized. This message has been sent via JumpStarts' API."
  microblog.run
