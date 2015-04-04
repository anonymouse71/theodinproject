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

  def my_none?
    return true if self.empty?

    self.my_each do |i|
      return true if yield(i)
    end
    return false
  end

  def my_count arg=0
    if block_given?
      self.my_select{|i| yield(i)}.length
    elsif arg != 0
      self.select{|i| i == arg}.length
    else
      self.size
    end
  end

  def my_map
    items = []
    self.my_each do |i|
      items << yield(i)
    end
    items
  end

  def my_inject input=0
    result = input
    self.my_each do |i|
      result = yield(result, i)
    end
    result
  end

  def multiply_els
    self.my_inject(1){|product, n| product * n}
  end
end

#p [1,2,3].my_each {|x| p x}
#p ['a','b','c'].my_each_with_index {|l, index| p "#{index}. #{l}"}
#p (1..5).to_a.my_select {|x| x % 2 == 0}
#p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
#p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
#p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
#p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
#p [].my_none?                                           #=> true
#p [nil].my_none?                                        #=> true
#p [nil, false].my_none?                                 #=> true
#p [1,2,3,3].my_count                 #=> 4
#p [1,2,3,3].my_count(3)              #=> 2
#p [1,2,3,3].my_count{|x| x > 1}      #=> 3
#p [1,2,3].my_map {|x| x*2 }
#p [1,2,3].my_inject {|sum, n| sum + n}     #=> 6
#p [2,4,5].multiply_els               #=> 40
