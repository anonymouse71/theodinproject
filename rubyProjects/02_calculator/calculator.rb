#completed challenge
def add num1, num2
  num1 + num2
end

def subtract num1, num2
  num1 - num2
end

def sum numbers
  numbers = [0] if numbers.empty?
  numbers.reduce(:+)
end

def multiply num1, num2
  num1 * num2
end

def multiplies numbers
  numbers.reduce(:*)
end

def power num1, num2
  num1 ** num2
end

def factorial num
  num = 1 if num == 0
  numbers = num.downto(1).to_a 
  numbers.reduce(:*)
end
