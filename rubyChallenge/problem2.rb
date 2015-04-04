# project euler problem2 in rb

def sum_of_fibonacci
  limit = 4_000_000
  a = 0
  b = 1
  sum = 0

  while a < limit
    sum += a if a % 2 == 0

    c = a + b
    a = b
    b = c
  end
  sum
end

p sum_of_fibonacci
