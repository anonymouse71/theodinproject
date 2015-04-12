def rock_judger rocks
  if rocks.length <= 2
    a = rocks[0]
    b = rocks[-1]
  else
    a = rock_judger(rocks.slice!(0,rocks.length/2))
    b = rock_judger(rocks)
  end
  return a > b ? a : b
end

#rocks = 30.times.map {rand(200) + 1}
#puts rocks.join(', ')
#p rock_judger(rocks)

def append array, n
  return array if n < 0
  array << n
  append(array, n-1)
end

def reverse_append array, n
  return array if n < 0
  reverse_append(array, n-1)
  array << n
  array
end

#p append([], 2)
#p reverse_append([], 2)

# Define a recursive function that finds the factorial of a number.

def factorial n
  return 1 if n == 0
  return n * factorial(n-1)
end

#p factorial 4

# Define a recursive function that returns true if a string is a palindrome and false otherwise

def palindrome(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome(string[1..-2])
    else
      false
    end
  end
end

#p palindrome 'anna'

# Define a recursive function that takes an argument n and prints "n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".

def bottles_on_the_wall n
  return "no more bottles of beer on the wall" if  n == 0
  puts "#{n} bottles of beers on the wall"
  bottles_on_the_wall(n-1)
end

p bottles_on_the_wall 5
