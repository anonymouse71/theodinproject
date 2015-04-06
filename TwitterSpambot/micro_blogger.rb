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
end

microblog = MicroBlogger.new

