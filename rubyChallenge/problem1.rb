# find all the multipes of 3 and 5 given an number, then output the sum.

def sum_of_multiples integer
  sum = 0;
  multiples_of_three_and_five = []
  
  integer.times do |num|
    multiples_of_three_and_five.push(num) if num % 3 == 0 || num % 5 == 0
  end

  sum = multiples_of_three_and_five.reduce(:+)
end
p sum_of_multiples 1000
