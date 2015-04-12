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
