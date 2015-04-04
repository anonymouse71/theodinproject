# find the largest prime factor of nth number

def find_largest_prime_factor num
  factor = 2

  while num > factor
    if num % factor == 0
      num = num / factor
    else
      factor += 1
    end
  end
  factor
end

p find_largest_prime_factor 600851475143
