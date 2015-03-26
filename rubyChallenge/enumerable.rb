module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

end

p [1,2,3].my_each {|x| p x}
