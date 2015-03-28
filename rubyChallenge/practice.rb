# A class is a blueprint for the objects your trying to model, but in reality a class holds data, and has methods which interact with the data, and are used to instantiate objects
#

class WhatAreClasses
  def initialize
    @data = "I'm an instance data of this object. Hello"
  end

  def method
    puts @data.gsub("instance", "altered")
  end
end

object = WhatAreClasses.new
object.method

#what are objects?
#=> An object is an instance of a class. And is the root class in ruby.

# What are modules?
# => Modules are served as a mechanism for namespace.

module ANamespace
  class AClass
    def initialize
      puts "Another object. Coming right up!"
    end
  end
end

ANamespace::AClass.new
