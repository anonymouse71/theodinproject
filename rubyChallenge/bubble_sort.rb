# implement the bubble sort algorithm in ruby
# input => Array of numbers
# output => Sorted Array


test = [0,2,2,3,4,78]

def bubble_sort numbers
  return numbers if numbers.length <= 1 
  n = numbers.length - 1
  sorted = false

  until sorted
    sorted = true
    n.times do |i|
      if numbers[i] > numbers[i+1]
        numbers[i], numbers[i+1] = numbers[i+1], numbers[i] 
        sorted = false
      end
    end
  end
  numbers
end

p bubble_sort test

# implement bubble_sort_by which sorts an array but accepts a block

def bubble_sort_by words
  return words if words.length <= 1 
  n = words.length - 1
  sorted = false

  until sorted
    sorted = true
    n.times do |i|
      if yield(words[i], words[i+1]) < 0
        words[i], words[i+1] = words[i+1], words[i] 
        sorted = false
      end
    end
  end
  words
end

p bubble_sort_by(["hi", "hello", "hey"]) {|l,r| r.length - l.length }
