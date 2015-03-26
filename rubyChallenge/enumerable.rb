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
    self.my_each do |i|
      truthy_results << i if yield(i)
    end
    truthy_results
  end

  def my_all?
    self.my_each do |i|
      return false unless yield(i)
    end
    return true
  end

  def my_any?
    self.my_each do |i|
      return true unless yield(i)
    end
    return false
  end

end

#p [1,2,3].my_each {|x| p x}
#p ['a','b','c'].my_each_with_index {|l, index| p "#{index}. #{l}"}
#p (1..5).to_a.my_select {|x| x % 2 == 0}
#p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
#p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
