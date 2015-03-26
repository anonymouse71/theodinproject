module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    c = 0
    while i < self.length
      yield self[i], c
      i += 1
      c += 1
    end
    self
  end

  def my_select
    i = 0
    truthy_results = []
    while i < self.length
      truthy_results << self[i] if yield(self[i])
      i += 1
    end
    truthy_results
  end

end

#p [1,2,3].my_each {|x| p x}
#p ['a','b','c'].my_each_with_index {|l, index| p "#{index}. #{l}"}
p (1..5).to_a.my_select {|x| x % 2 == 0}
